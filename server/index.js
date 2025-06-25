import express from 'express';
import cors from 'cors';
import fs from 'fs/promises';
import path from 'path';
import multer from 'multer';

const app = express();
const PORT = process.env.PORT || 3001;

// Configuration
const TEMPLATES_DIR = path.resolve('../samples'); // relative to server folder

app.use(cors());
app.use(express.json({ limit: '50mb' }));

// Utility to extract base64 images in XSLT file
function extractBase64Images(xsltContent) {
  const regex = /src="data:image\/[^;]+;base64,([^\"]+)"/g;
  let match;
  const images = [];
  let index = 0;
  while ((match = regex.exec(xsltContent)) !== null) {
    images.push({ id: index, base64: match[1] });
    index += 1;
  }
  return images;
}

function replaceImage(xsltContent, imageId, newBase64) {
  let currentIndex = -1;
  const replaced = xsltContent.replace(/src="data:image\/[^;]+;base64,([^\"]+)"/g, (match) => {
    currentIndex += 1;
    if (currentIndex === imageId) {
      return match.replace(/base64,[^"]+"/, `base64,${newBase64}"`);
    }
    return match;
  });
  return replaced;
}

// List templates
app.get('/api/templates', async (req, res) => {
  try {
    const files = await fs.readdir(TEMPLATES_DIR);
    const xsltFiles = files.filter((f) => f.endsWith('.xslt'));
    res.json(xsltFiles);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Unable to list templates' });
  }
});

// Get images in template
app.get('/api/templates/:name/images', async (req, res) => {
  const { name } = req.params;
  const filePath = path.join(TEMPLATES_DIR, name);
  try {
    const content = await fs.readFile(filePath, 'utf-8');
    const images = extractBase64Images(content).map((img, idx) => ({ id: idx, dataUrl: `data:image;base64,${img.base64}` }));
    res.json(images);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Unable to read template' });
  }
});

// Multer setup for image upload
const storage = multer.memoryStorage();
const upload = multer({ storage });

// Replace image endpoint
app.post('/api/templates/:name/images/:id', upload.single('image'), async (req, res) => {
  const { name, id } = req.params;
  const filePath = path.join(TEMPLATES_DIR, name);

  if (!req.file) {
    return res.status(400).json({ error: 'No image uploaded' });
  }

  const newBase64 = req.file.buffer.toString('base64');

  try {
    const content = await fs.readFile(filePath, 'utf-8');
    const updated = replaceImage(content, parseInt(id, 10), newBase64);
    await fs.writeFile(filePath, updated, 'utf-8');
    res.json({ success: true });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Unable to replace image' });
  }
});

// Serve client build if exists
const clientBuildPath = path.resolve('..', 'client');
app.use(express.static(clientBuildPath));

app.use('/samples', express.static(path.resolve('..', 'samples')));

app.get('/', (req, res) => {
  res.sendFile(path.join(clientBuildPath, 'index.html'));
});

app.get('*', (req, res) => {
  res.redirect('/');
});

app.listen(PORT, () => {
  console.log(`Server started on http://localhost:${PORT}`);
}); 