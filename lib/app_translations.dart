import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'appTitle': 'ToothPik',
          'takePhoto': 'Take A Photo',
          'pickGallery': 'Pick From Gallery',
          'noImage': 'No Image Selected',
          "hasCavity": "Your teeth have cavity.",
          "hasNoCavity": "Your teeth are cavity-free.",
          "teethRes": "Teeth Classification Result",
          "ok": "OK",
          "noTeeth": "No Teeth Detected",
          "pTakePhoto": "Please take a photo of your teeth",
          "att": "ATTENTION!",
          "info":
              "When taking the photo, Please make sure your teeth are clearly visible and your camera's flash is on and the light does not cast a shadow.",
          "dShow": "Don't Show Again",
          "err": "Error",
          "errMsg":
              "An error occurred. Please report the error to the developer.",
          "zoom": "Pinch to Zoom",
          "internet": "No internet connection. Please connect to the internet.",
          "disclaimer":
              "This may not produce fully accurate results. This is just a prediction."
        },
        'tr': {
          "appTitle": "DişÇek",
          "takePhoto": "Fotoğraf Çek",
          "pickGallery": "Galeriden Seç",
          "noImage": "Resim Seçilmedi",
          "hasCavity": "Dişiniz çürük",
          "hasNoCavity": "Dişinizde çürük yok",
          "teethRes": "Diş Analizi Sonucu",
          "ok": "Tamam",
          "noTeeth": "Diş Tespit Edilmedi",
          "pTakePhoto": "Lütfen, sadece dişinizin fotoğrafını çekin",
          "att": "DİKKAT!",
          "info":
              "Fotoğraf çekerken lütfen kameranızın flaşının açık olduğundan ve dişlerinizin net bir şekilde görünüp ışığın gölge yapmadığından emin olunuz.",
          "dShow": "Tekrar Gösterme",
          "err": "Hata",
          "errMsg": "Bir hata oluştu. Lütfen hatayı geliştiriciye rapor edin.",
          "zoom": "Yakınlaştır",
          "internet": "İnternet bağlantısı yok. Lütfen internete bağlanın.",
          "disclaimer": "Sonuçlar kesin değildir. Bunlar sadece birer tahmin"
        },
      };
}
