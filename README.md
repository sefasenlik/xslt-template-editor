# XSLT Image Editor

A professional web-based tool for editing embedded images in Turkish e-invoice and e-archive XSLT templates.

## Features

- **🖼️ Image Management**: Extract, preview, and replace Base64-encoded images in XSLT templates
- **📐 Dimension Control**: Adjust image width and height with real-time preview
- **👁️ Live Preview**: See your changes instantly with sample invoice data
- **🌐 Bilingual Support**: Full English and Turkish language support
- **💾 Easy Export**: Download modified XSLT templates
- **🔒 Client-Side Processing**: All operations happen locally in your browser for security

## System Requirements

- Modern web browser (Chrome, Firefox, Safari, Edge)
- No internet connection required after initial load
- No server installation needed

## Installation & Usage

### Option 1: Direct Use
1. Download the `index.html` file
2. Double-click to open in your web browser
3. Start editing your XSLT templates!

### Option 2: Local Web Server (Recommended)
1. Extract the application files
2. Serve the directory using any web server:
   - **Python**: `python -m http.server 8000`
   - **Node.js**: `npx serve .`
   - **PHP**: `php -S localhost:8000`
3. Open `http://localhost:8000` in your browser

## How to Use

1. **Select XSLT File**: Click "📁 Select XSLT File" to upload your template
2. **Edit Images**: 
   - View extracted images with their current dimensions
   - Click "🖼️ Replace Image" to upload new images (max 64KB)
   - Adjust width and height using the input fields
3. **Preview**: See your changes in the live preview panel
4. **Download**: Click "💾 Download Modified XSLT" to save your changes

## File Size Limits

- **Images**: Maximum 64KB per image
- **XSLT Templates**: No specific limit (browser memory dependent)

## Supported Image Formats

- PNG, JPG, JPEG, GIF, BMP, WebP
- Images are automatically converted to Base64 format

## Browser Compatibility

- ✅ Chrome 60+
- ✅ Firefox 55+
- ✅ Safari 11+
- ✅ Edge 79+

## Security & Privacy

- **100% Client-Side**: No data is sent to any server
- **Local Processing**: All operations happen in your browser
- **No Data Storage**: Files are not saved or cached by the application

## Technical Details

- **Frontend**: Pure HTML5, CSS3, JavaScript (ES6+)
- **XSLT Processing**: Browser-native XSLTProcessor API
- **File Handling**: FileReader API for local file operations
- **No Dependencies**: Completely self-contained application

## Troubleshooting

### Preview Not Working
- Ensure your XSLT template is valid XML
- Check that the template contains proper XSLT transformation rules

### Images Not Displaying
- Verify images are embedded as Base64 data URLs
- Check that image tags follow standard HTML format

### File Upload Issues
- Ensure image files are under 64KB
- Try using different image formats (PNG recommended)

## Development

This is a single-file application built with vanilla JavaScript. To modify:

1. Edit `index.html` directly
2. Test in multiple browsers
3. Validate XSLT processing with sample templates

## License

© 2025 1C International. All rights reserved.
Created by Uğur Emir Taşkın and Sefa Şenlik.

## Support

For technical support or feature requests, please contact senliksefa@gmail.com.

---

**Version**: 1.2  
**Last Updated**: June 2025  
**Compatible with**: Turkish e-invoice/e-archive systems 