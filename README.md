<img src="https://gcdnb.pbrd.co/images/4Z0TgD3vIbxa.png?o=1" width="750" />

# XSLT Görsel Düzenleyici

Türk e-fatura ve e-arşiv XSLT şablonlarındaki gömülü resimleri düzenlemek için profesyonel web tabanlı araç.

## Özellikler

- **🖼️ Resim Yönetimi**: XSLT şablonlarından Base64 kodlu resimleri çıkarın, önizleyin ve değiştirin
- **📐 Boyut Kontrolü**: Gerçek zamanlı önizleme ile resim genişlik ve yüksekliklerini ayarlayın
- **👁️ Canlı Önizleme**: Örnek fatura verisi ile şablonda yaptığınız değişiklikleri anında görün
- **🌐 Çift Dilli Destek**: Tam İngilizce ve Türkçe dil desteği
- **💾 Kolay Dışa Aktarım**: Düzenlenmiş XSLT şablonlarını indirin
- **🔒 İstemci Tarafı İşleme**: Tüm işlemler güvenlik amacıyla tarayıcınızda yerel olarak gerçekleştirilir

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

1. **XSLT Dosyası Seç**: "📁 XSLT Dosyası Seç" düğmesine tıklayarak şablonunuzu yükleyin
2. **Resimleri Düzenle**:
   - Çıkarılan resimleri mevcut boyutlarıyla görüntüleyin
   - "🖼️ Resmi Değiştir" düğmesine tıklayarak yeni resimler yükleyin (maks. 64 KB)
   - Genişlik ve yükseklik alanlarını kullanarak boyutları ayarlayın
3. **Önizleme**: Canlı önizleme panelinde değişikliklerinizi anında görüntüleyin
4. **İndir**: "💾 Değiştirilmiş XSLT'yi İndir" düğmesine tıklayın

## Dosya Boyutu Sınırları

- **Resimler**: Her resim için maksimum 64 KB
- **XSLT Şablonları**: Özel bir sınır yok (tarayıcı belleği ile sınırlı)

## Desteklenen Görsel Formatları

- PNG, JPG, JPEG, GIF, BMP, WebP
- Resimler otomatik olarak Base64 formatına dönüştürülür

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

## Sorun Giderme

### Önizleme Çalışmıyor
- XSLT şablonunuzun geçerli XML olduğundan emin olun
- Şablonun doğru XSLT dönüşüm kurallarını içerdiğini kontrol edin

### Resimler Görüntülenmiyor
- Resimlerin Base64 veri URL'si olarak gömülü olduğundan emin olun
- Resim etiketlerinin standart HTML formatında olduğundan emin olun

### Dosya Yükleme Sorunları
- Resim dosyalarının 64 KB altında olduğundan emin olun
- Farklı resim formatlarını deneyin (PNG önerilir)

## Geliştirme

Bu uygulama saf JavaScript kullanılarak tek dosyalık yapıda geliştirilmiştir. Değişiklik yapmak için:

1. `index.html` dosyasını düzenleyin
2. Birden fazla tarayıcıda test edin
3. Örnek şablonlarla XSLT işlemini doğrulayın

## Lisans

© 2025 1C International. Tüm hakları saklıdır.  
Oluşturan: Uğur Emir Taşkın ve Sefa Şenlik.

## Destek

Teknik destek veya özellik talepleri için senliksefa@gmail.com adresine ulaşabilirsiniz.

---

**Sürüm**: 1.2  
**Son Güncelleme**: Haziran 2025  
**Uyumluluk**: Türk e-fatura/e-arşiv sistemleri  

---

> **English version below / İngilizce sürüm aşağıdadır**

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
