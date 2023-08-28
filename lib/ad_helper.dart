import 'dart:io';

class AdHelper {

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-8877496646325962/9222253121';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-8877496646325962/4460919029';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-8877496646325962/9222253121';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-8877496646325962/4460919029';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-8877496646325962/9222253121';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-8877496646325962/4460919029';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}