import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class SaveWordsArguments {
  final Set<WordPair> words;
  SaveWordsArguments(this.words);
}

class SaveWords extends StatelessWidget {
  const SaveWords({Key? key}) : super(key: key);

  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Save Words"),
      ),
      body: _buildList(context),
    );
  }

  Widget _buildList(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as SaveWordsArguments;
    final tiles = args.words.map(
      (WordPair pair) {
        return ListTile(
          title: Text(
            pair.asPascalCase,
            style: _biggerFont,
          ),
        );
      }
    );

    final divided = ListTile.divideTiles(
      context: context,
      tiles: tiles,
    ).toList();

    return ListView(children: divided);
  }
}