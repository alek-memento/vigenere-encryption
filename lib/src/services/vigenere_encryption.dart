class VigenereEncryption {
  List<String> alphabet = 'abcdefghijklmnopqrstuvwxyz'.split('');

  String encrypt(String passPhrase, String plainText) {
    if (passPhrase.trim().isEmpty || plainText.trim().isEmpty) return '';

    List<String>  passPhraseList = passPhrase.toLowerCase().split('');
    List<String> textPhraseList = plainText.toLowerCase().split('');

    /// must be same length .
    if (passPhraseList.length < textPhraseList.length) {
      final length = textPhraseList.length - passPhraseList.length;
      for ( int i = 0 ; i < length ; i++) {
        passPhraseList.add(passPhrase[i%passPhrase.length]);
      }
    } else if (passPhraseList.length > textPhraseList.length) {
      final length = passPhraseList.length - textPhraseList.length;
      for ( int i = 0 ; i < length ; i++) {
        textPhraseList.add(passPhrase[i%plainText.length]);
      }
    }

    List<String> encryptedPhrase = [];

    for (int i = 0; i < textPhraseList.length; i++) {
      final String passChar = passPhraseList[i];
      final indexPassChar = alphabet.indexOf(passChar);

      final String textChar = textPhraseList[i];
      final indexTextChar = alphabet.indexOf(textChar);

      final indexOffsetChar = (indexTextChar + indexPassChar) % alphabet.length;
      encryptedPhrase.add(alphabet[indexOffsetChar]);
    }
    return encryptedPhrase.join();
  }

  String decrypt(String passPhrase, String encryptedText) {

    if (passPhrase.trim().isEmpty || encryptedText.trim().isEmpty) return '';

    List<String>  passPhraseList = passPhrase.toLowerCase().split('');
    List<String> encryptedPhraseList = encryptedText.toLowerCase().split('');

    List<String> decryptPhrase = [];

    for (int i = 0 ; i < encryptedPhraseList.length ; i++){
      final String passChar = passPhraseList[i];
      final indexPassChar = alphabet.indexOf(passChar);

      final String textChar = encryptedPhraseList[i];
      final indexEncryptedChar = alphabet.indexOf(textChar);

      final indexOffsetChar = (indexEncryptedChar - indexPassChar) % alphabet.length;
      decryptPhrase.add(alphabet[indexOffsetChar]);
    }

    return decryptPhrase.join();
  }
}
