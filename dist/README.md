# XSLT Template Editor

A professional web-based tool for editing XSLT templates used in Turkish e-invoice and e-archive systems, with live preview and syntax highlighting.

## Features

- **📝 Live Code Editing**: Direct XSLT editing with real-time syntax highlighting
- **🖼️ Image Management**: Extract, preview, and replace Base64-encoded images in XSLT templates
- **📐 Dimension Control**: Adjust image width and height with instant preview updates
- **👁️ Live Preview**: Transform your XSLT with actual XML data for realistic preview
- **📄 XML Data Support**: Upload your own XML files for accurate template testing
- **🔧 Resizable Interface**: Drag-to-resize panels for optimal workspace layout
- **🌐 Bilingual Support**: Full English and Turkish language support with toggle
- **🎨 Syntax Highlighting**: Color-coded XSLT/XML syntax for better readability
- **💾 Easy Export**: Download modified XSLT templates
- **🔒 Client-Side Processing**: All operations happen locally in your browser for security

## System Requirements

- Modern web browser (Chrome, Firefox, Safari, Edge)
- No internet connection required after initial load
- No server installation needed

## Installation & Usage

### Option 1: Direct Use
1. Download the application files
2. Double-click `index.html` to open in your web browser
3. Start editing your XSLT templates!

### Option 2: Local Web Server (Recommended)
1. Extract the application files
2. Serve the directory using any web server:
   - **Python**: `python -m http.server 8000`
   - **Node.js**: `npx serve .`
   - **PHP**: `php -S localhost:8000`
3. Open `http://localhost:8000` in your browser

## How to Use

### Basic Workflow
1. **Upload XSLT Template**: Click "📁 Choose File" to select your XSLT template
2. **Upload XML Data**: Click "📄 Choose XML File" to provide sample data for preview
3. **Edit Code**: Use the syntax-highlighted editor to modify your XSLT directly
4. **Manage Images**: 
   - View extracted images with their current dimensions
   - Click "🖼️ Replace Image" to upload new images (max 64KB)
   - Adjust width and height using the input fields
5. **Live Preview**: See your changes instantly in the preview panel
6. **Resize Panels**: Drag the divider between code and preview for optimal layout
7. **Download**: Click "💾 Download Modified XSLT" to save your changes

### Interface Features
- **Language Toggle**: Switch between English (EN) and Turkish (TR)
- **Resizable Panels**: Drag the yellow divider to adjust code/preview split
- **Syntax Highlighting**: XSLT/XML elements are color-coded for clarity
- **Line Numbers**: Navigate your code easily with numbered lines
- **Real-time Updates**: Preview updates automatically as you type (300ms delay)

## File Requirements

### XSLT Templates
- Valid XML/XSLT format
- Can contain embedded Base64 images
- No specific file size limit (browser memory dependent)

### XML Data Files
- Valid XML format
- Should match the structure expected by your XSLT template
- Used for generating realistic preview output

### Images
- **Maximum Size**: 64KB per image
- **Supported Formats**: PNG, JPG, JPEG, GIF, BMP, WebP
- **Automatic Conversion**: Images are converted to Base64 format

## Technical Features

### Code Editor
- **Syntax Highlighting**: XML tags, attributes, values, and comments
- **Line Numbers**: Synchronized with code content
- **Live Editing**: Real-time updates with debounced preview refresh
- **Text Selection**: Proper selection highlighting with yellow background
- **Scroll Synchronization**: Line numbers and highlighting stay aligned

### Preview System
- **XSLT Transformation**: Uses browser-native XSLTProcessor API
- **Error Handling**: Clear error messages for invalid XSLT or XML
- **External Libraries**: Supports QR codes and barcodes in templates
- **Interactive Navigation**: Double-click preview elements to jump to source code

### User Interface
- **1C Enterprise Design**: Professional yellow/gold color scheme
- **Responsive Layout**: Works on desktop and tablet devices
- **Accessibility**: Keyboard navigation and screen reader friendly
- **Professional Styling**: Clean shadows, borders, and typography

## Browser Compatibility

- ✅ Chrome 60+
- ✅ Firefox 55+
- ✅ Safari 11+
- ✅ Edge 79+

## Security & Privacy

- **100% Client-Side**: No data is sent to any server
- **Local Processing**: All operations happen in your browser
- **No Data Storage**: Files are not saved or cached by the application
- **Secure File Handling**: FileReader API for safe local file operations

## Technical Architecture

- **Frontend**: Pure HTML5, CSS3, JavaScript (ES6+)
- **XSLT Processing**: Browser-native XSLTProcessor API
- **File Handling**: FileReader API for local file operations
- **Syntax Highlighting**: Custom XML/XSLT parser with CSS styling
- **No Dependencies**: Completely self-contained application
- **Responsive Design**: CSS Flexbox with media queries

## Troubleshooting

### Preview Not Working
- Ensure both XSLT template and XML data files are uploaded
- Verify your XSLT template is valid XML
- Check that the template contains proper XSLT transformation rules
- Ensure XML data matches the structure expected by your template

### Code Editor Issues
- If syntax highlighting is missing, try refreshing the page
- For large files, typing may have a slight delay (this is normal)
- Use Ctrl+A to select all text if needed

### Images Not Displaying
- Verify images are embedded as Base64 data URLs in the XSLT
- Check that image tags follow standard HTML format
- Ensure images are under 64KB file size limit

### File Upload Issues
- Try refreshing the page if buttons don't respond
- Ensure files are valid XML/XSLT format
- Check browser console for any error messages

### Panel Resizing
- If resizing doesn't work, try refreshing the page
- Drag the yellow divider between code and preview panels
- Minimum panel width is 200px

## Development

This is a single-file application built with vanilla JavaScript. To modify:

1. Edit `index.html` directly
2. Test syntax highlighting with various XSLT templates
3. Validate XSLT processing with sample XML data
4. Test responsive design on different screen sizes

## License

© 2025 1C International. All rights reserved.

## Support

For technical support or feature requests, please contact your system administrator.

---

**Version**: 2.0  
**Last Updated**: January 2025  
**Compatible with**: Turkish e-invoice/e-archive systems  
**New Features**: Live code editing, XML data support, syntax highlighting, resizable interface 