<img src="https://i.postimg.cc/YrtBkH7m/Template-Editor-v1-3.png" width="750" />

> **English version below.**

# XSLT Görsel Düzenleyici

Türk e-fatura ve e-arşiv XSLT şablonlarındaki gömülü resimleri düzenlemek için profesyonel web tabanlı araç.

## Özellikler

- **🖼️ Resim Yönetimi**: XSLT şablonlarından Base64 kodlu resimleri çıkarın, önizleyin ve değiştirin
- **📐 Boyut Kontrolü**: Gerçek zamanlı önizleme ile resim genişlik ve yüksekliklerini ayarlayın
- **👁️ Canlı Önizleme**: Örnek fatura verisi ile şablonda yaptığınız değişiklikleri anında görün
- **🌐 Çift Dilli Destek**: Tam İngilizce ve Türkçe dil desteği
- **💾 Kolay Dışa Aktarım**: Düzenlenmiş XSLT şablonlarını indirin
- **🔒 İstemci Tarafı İşleme**: Tüm işlemler güvenlik amacıyla tarayıcınızda yerel olarak gerçekleştirilir
- **🔧 Gelişmiş Kod Editörü**: VS Code teması ile syntax highlighting ve satır numaraları
- **🔁 BASE64 Dönüştürücü**: Resimleri otomatik olarak BASE64 formatına dönüştürün
- **🎯 Akıllı Navigasyon**: Önizlemede çift tıklayarak kaynak kodda ilgili satıra gidin
- **⚙️ Esnek Arayüz**: Gizlenebilir sol panel ve yeniden boyutlandırılabilir bölümler
- **📄 Çift Dosya Desteği**: XSLT şablonu ve XML veri dosyası ayrı ayrı yükleyin

## Sistem Gereksinimleri

- Modern web tarayıcısı (Chrome, Firefox, Safari, Edge)
- İlk yüklemeden sonra internet bağlantısı gerekmez
- Sunucu kurulumu gerekmez

## Kurulum & Kullanım

### Seçenek 1: Doğrudan Kullanım
1. `index.html` dosyasını indirin
2. Dosyaya çift tıklayarak tarayıcınızda açın
3. XSLT şablonlarınızı düzenlemeye başlayın!

### Seçenek 2: Yerel Web Sunucusu (Gelişmiş)
1. Uygulama dosyalarını çıkarın
2. Dizini herhangi bir web sunucusu ile yayınlayın:
   - **Python**: `python -m http.server 8000`
   - **Node.js**: `npx serve .`
   - **PHP**: `php -S localhost:8000`
3. Tarayıcınızda `http://localhost:8000` adresini açın

## Nasıl Kullanılır

1. **XSLT Dosyası Seç**: "📁 XSLT Dosyası (Şablon)" düğmesine tıklayarak şablonunuzu yükleyin
2. **XML Dosyası Seç**: "📄 XML Dosyası (Belge Verileri)" düğmesine tıklayarak örnek veri dosyanızı yükleyin
3. **Resimleri Düzenle**:
   - Saptanan resimleri mevcut boyutlarıyla görüntüleyin
   - "🖼️ Değiştir" düğmesine tıklayarak yeni resimler yükleyin
   - Genişlik ve yükseklik alanlarını kullanarak boyutları ayarlayın
4. **BASE64 Dönüştürücü**: "🔁 BASE64 Dönüştürücü" bölümünde yeni resimler yükleyerek otomatik BASE64 koduna dönüştürün
5. **Kod Düzenleme**: Gelişmiş editörde XSLT kodunu doğrudan düzenleyin
6. **Önizleme**: Canlı önizleme panelinde değişikliklerinizi anında görüntüleyin
7. **Navigasyon**: Önizlemede herhangi bir öğeye çift tıklayarak kaynak kodda ilgili satıra gidin
8. **İndir**: "💾 Değiştirilmiş XSLT'yi İndir" düğmesine tıklayın

## Yeni Özellikler

### 🔧 Gelişmiş Kod Editörü
- VS Code teması ile syntax highlighting
- Satır numaraları
- Gerçek zamanlı kod düzenleme
- Otomatik önizleme güncellemesi

### 🔁 BASE64 Dönüştürücü
- Resimleri otomatik olarak BASE64 formatına dönüştürme
- 64KB boyut sınırına uygun otomatik sıkıştırma
- Panoya kopyalama özelliği
- Temizleme fonksiyonu

### 🎯 Akıllı Navigasyon
- Önizlemede çift tıklayarak kaynak kodda ilgili satıra gitme
- Resimler için özel navigasyon
- Otomatik satır vurgulama

### ⚙️ Esnek Arayüz
- Gizlenebilir sol panel
- Yeniden boyutlandırılabilir bölümler
- Responsive tasarım
- Dil seçici (EN/TR)

## Desteklenen Görsel Formatları

- PNG, JPG, JPEG, GIF, BMP, WebP
- Resimler otomatik olarak Base64 formatına dönüştürülür
- Otomatik sıkıştırma ile boyut optimizasyonu

## Tarayıcı Uyumluluğu

- ✅ Chrome 60+
- ✅ Firefox 55+
- ✅ Safari 11+
- ✅ Edge 79+

## Güvenlik & Gizlilik

- **%100 İstemci Tarafı**: Hiçbir veri sunucuya gönderilmez
- **Yerel İşleme**: Tüm işlemler tarayıcınızda gerçekleşir
- **Veri Saklama Yok**: Uygulama dosyaları kaydedilmez veya önbelleğe alınmaz

## Teknik Detaylar

- **Ön Yüz**: Saf HTML5, CSS3, JavaScript (ES6+)
- **XSLT İşleme**: Tarayıcı yerleşik XSLTProcessor API
- **Dosya İşleme**: Yerel dosya işlemleri için FileReader API
- **Bağımlılık Yok**: Tamamen tek dosyalık bir uygulama
- **Syntax Highlighting**: Özel VS Code teması
- **Resim Sıkıştırma**: Canvas API ile otomatik optimizasyon

## Sorun Giderme

### Önizleme Çalışmıyor
- XSLT şablonunuzun geçerli XML olduğundan emin olun
- Şablonun doğru XSLT dönüşüm kurallarını içerdiğini kontrol edin
- XML dosyasının geçerli olduğundan emin olun

### Resimler Görüntülenmiyor
- Resimlerin Base64 veri URL'si olarak gömülü olduğundan emin olun
- Resim etiketlerinin standart HTML formatında olduğundan emin olun

### Dosya Yükleme Sorunları
- Farklı resim formatlarını deneyin (PNG önerilir)
- Otomatik sıkıştırma özelliği büyük dosyaları küçültür

### Kod Editörü Sorunları
- Syntax highlighting için modern tarayıcı kullanın
- Büyük dosyalar için biraz zaman gerekebilir

## Geliştirme

Bu uygulama saf JavaScript kullanılarak tek dosyalık yapıda geliştirilmiştir. Değişiklik yapmak için:

1. `index.html` dosyasını düzenleyin
2. Birden fazla tarayıcıda test edin
3. Örnek şablonlarla XSLT işlemini doğrulayın

## Lisans

© 2025 1C International. MIT Lisansı.  
Oluşturan: Uğur Emir Taşkın ve Sefa Şenlik.

## Destek

Teknik destek veya özellik talepleri için senliksefa@gmail.com adresine ulaşabilirsiniz.

---

**Sürüm**: 1.3  
**Son Güncelleme**: Temmuz 2025  
**Uyumluluk**: Türk e-fatura/e-arşiv sistemleri  

---

# XSLT Image Editor

A professional web-based tool for editing embedded images in Turkish e-invoice and e-archive XSLT templates.

## Features

- **🖼️ Image Management**: Extract, preview, and replace Base64-encoded images in XSLT templates
- **📐 Dimension Control**: Adjust image width and height with real-time preview
- **👁️ Live Preview**: See your changes instantly with sample invoice data
- **🌐 Bilingual Support**: Full English and Turkish language support
- **💾 Easy Export**: Download modified XSLT templates
- **🔒 Client-Side Processing**: All operations happen locally in your browser for security
- **🔧 Advanced Code Editor**: Syntax highlighting with VS Code theme and line numbers
- **🔁 BASE64 Converter**: Automatically convert images to BASE64 format
- **🎯 Smart Navigation**: Double-click in preview to navigate to source code
- **⚙️ Flexible Interface**: Collapsible left panel and resizable sections
- **📄 Dual File Support**: Upload XSLT template and XML data file separately

## System Requirements

- Modern web browser (Chrome, Firefox, Safari, Edge)
- No internet connection required after initial load
- No server installation needed

## Installation & Usage

### Option 1: Direct Use
1. Download the `index.html` file
2. Double-click to open in your web browser
3. Start editing your XSLT templates!

### Option 2: Local Web Server (Advanced)
1. Extract the application files
2. Serve the directory using any web server:
   - **Python**: `python -m http.server 8000`
   - **Node.js**: `npx serve .`
   - **PHP**: `php -S localhost:8000`
3. Open `http://localhost:8000` in your browser

## How to Use

1. **Select XSLT File**: Click "📁 XSLT File (Template)" to upload your template
2. **Select XML File**: Click "📄 XML File (Document Data)" to upload your sample data file
3. **Edit Images**: 
   - View extracted images with their current dimensions
   - Click "🖼️ Replace" to upload new images
   - Adjust width and height using the input fields
4. **BASE64 Converter**: Use "🔁 BASE64 Converter" section to upload new images and get automatic BASE64 conversion
5. **Code Editing**: Edit XSLT code directly in the advanced editor
6. **Preview**: See your changes in the live preview panel
7. **Navigation**: Double-click any element in preview to navigate to source code
8. **Download**: Click "💾 Download Modified XSLT" to save your changes

## New Features

### 🔧 Advanced Code Editor
- Syntax highlighting with VS Code theme
- Line numbers
- Real-time code editing
- Automatic preview updates

### 🔁 BASE64 Converter
- Automatic image conversion to BASE64 format
- Automatic compression to stay under 64KB limit
- Copy to clipboard functionality
- Clear function

### 🎯 Smart Navigation
- Double-click in preview to navigate to source code
- Special navigation for images
- Automatic line highlighting

### ⚙️ Flexible Interface
- Collapsible left panel
- Resizable sections
- Responsive design
- Language selector (EN/TR)

## Supported Image Formats

- PNG, JPG, JPEG, GIF, BMP, WebP
- Images are automatically converted to Base64 format
- Automatic compression for size optimization

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
- **Syntax Highlighting**: Custom VS Code theme
- **Image Compression**: Automatic optimization with Canvas API

## Troubleshooting

### Preview Not Working
- Ensure your XSLT template is valid XML
- Check that the template contains proper XSLT transformation rules
- Verify that your XML file is valid

### Images Not Displaying
- Verify images are embedded as Base64 data URLs
- Check that image tags follow standard HTML format

### File Upload Issues
- Try using different image formats (PNG recommended)
- Automatic compression feature reduces large files

### Code Editor Issues
- Use modern browser for syntax highlighting
- Large files may take a moment to process

## Development

This is a single-file application built with vanilla JavaScript. To modify:

1. Edit `index.html` directly
2. Test in multiple browsers
3. Validate XSLT processing with sample templates

## License

© 2025 1C International. MIT License.
Created by Uğur Emir Taşkın and Sefa Şenlik.

## Support

For technical support or feature requests, please contact senliksefa@gmail.com.

---

**Version**: 1.3  
**Last Updated**: July 2025  
**Compatible with**: Turkish e-invoice/e-archive systems 
