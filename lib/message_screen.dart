import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final List<String> userMessages = [];
  String inputText = ""; //deklarieren hier die Variable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 197, 161, 207),
        title: const Text("Text Input App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: userMessages.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(userMessages[index]),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  onChanged: (value) {
                    // mit der Funktion onchange kann man den Wert aktualisieren
                    setState(() {
                      inputText = value;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: "Enter Message...",
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      userMessages.insert(0, inputText);
                    });
                  },
                  child: const Text("Send Message"),
                ),
                const SizedBox(
                  height: 16,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
