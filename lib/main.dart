import 'package:flutter/material.dart';
import 'package:vigenere_encryption/src/services/vigenere_encryption.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController plainTextEncryptController =
      TextEditingController();
  final TextEditingController passPhraseEncryptController =
      TextEditingController();
  final TextEditingController plainTextDecryptController =
      TextEditingController();
  final TextEditingController passPhraseDecryptController =
      TextEditingController();

  String? encryptResult;
  String? decryptResult;

  void onEncrypt() {
    encryptResult = VigenereEncryption().encrypt(
      passPhraseEncryptController.text,
      plainTextEncryptController.text,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: <Widget>[
                  const Text(
                    "Encrypt",
                  ),
                  TextFormField(
                    controller: plainTextEncryptController,
                    decoration:
                        const InputDecoration(hintText: 'pass to encode'),
                  ),
                  TextFormField(
                    controller: passPhraseEncryptController,
                    decoration: const InputDecoration(hintText: 'passPhrase'),
                  ),
                  SelectableText(
                    encryptResult ?? "no data",
                  ),
                  ElevatedButton(
                    onPressed: onEncrypt,
                    child: const Text('encrypt'),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  const Text(
                    "Decrypt",
                  ),
                  TextFormField(
                    controller: plainTextDecryptController,
                    decoration:
                        const InputDecoration(hintText: 'pass to encode'),
                  ),
                  TextFormField(
                    controller: passPhraseDecryptController,
                    decoration: const InputDecoration(hintText: 'passPhrase'),
                  ),
                  SelectableText(
                      decryptResult ?? "no data"
                  ),
                  ElevatedButton(
                    onPressed: () {
                      decryptResult = VigenereEncryption().decrypt(
                        passPhraseDecryptController.text,
                        plainTextDecryptController.text,
                      );
                      setState(() {});
                    },
                    child: const Text('decrypt'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
