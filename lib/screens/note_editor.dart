import 'package:flutter/material.dart';
import 'package:note/styles/app_style.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';

class NoteEditorScreen extends StatefulWidget {
  const NoteEditorScreen({Key? key}) : super(key: key);

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _mainController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int color_id = Random().nextInt(AppStyle.cardsColor.length);
    String Date = DateTime.now().toString();
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor[color_id],
        iconTheme: IconThemeData(
          color: AppStyle.appBar,
        ),
        elevation: 0.0,
        title: Text(
          'Add a New Note',
          style: TextStyle(
            color: AppStyle.appBar,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Note Title'),
              style: AppStyle.mainTitle,
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                Date,
                style: AppStyle.DateTitle,
                textAlign: TextAlign.right,
              ),
            ),
            TextField(
              controller: _mainController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Your Note...'),
              style: AppStyle.mainContent,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppStyle.accentColor,
        child: Icon(Icons.save),
        onPressed: () async {
          FirebaseFirestore.instance.collection("notes").add({
            "note_title": _titleController.text,
            "note_content": _mainController.text,
            "creation_date": Date,
            "color_id": color_id,
          }).then((value) {
            print(value.id);
            Navigator.pop(context);
          }).catchError((error) => print("Failed to add note due to $error"));
        },
      ),
    );
  }
}
