import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_editor_pro/image_editor_pro.dart';
import 'dart:async';
//void main() => runApp(Editor());

class Editor extends StatefulWidget {
  File image;
  Editor({this.image});

  @override
  _EditorState createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  File _image;
  @override
  void initState() {
    super.initState();

    _image = widget.image;
  //  getimageditor(context);
  }

  Future<void> getimageditor(BuildContext context) async{
       await
        Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ImageEditorPro(
        image: _image,
        //  appBarColor: Colors.blue,
        bottomBarColor: Colors.blue,
      );
    })).then((geteditimage) {
      if (geteditimage != null) {
        setState(() {
          _image = geteditimage;
        });
      }
    }).catchError((er) {
      print(er);
    });
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
        
      appBar: AppBar(
        title: const Text('Image Editor'),
      ),
      body: Column(
        children: [
          Center(child: Image.file(_image)),
          // RaisedButton(onPressed: (){
          //   getimageditor(context);
          // }, child: Text("EDIT IMAGE"))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () {
        //  _image = null;
      //    setState(() {});
   getimageditor(context);

        },
      ),
    );
  }
}
