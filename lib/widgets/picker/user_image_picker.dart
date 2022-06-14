import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  final void Function(File pickedImage) imagePickFn;

  UserImagePicker(this.imagePickFn);

  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
   File _pickedImage;

  void _pickImage ()  async{
  final pickImageFile = await ImagePicker.pickImage(
    source: ImageSource.camera,
    imageQuality: 50,
    maxWidth: 150,
    );
  setState(() {
    _pickedImage = pickImageFile;
  });
  widget.imagePickFn(pickImageFile);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          backgroundImage: _pickedImage != null ? FileImage(_pickedImage) : null,
        ),
        FlatButton.icon(
          onPressed: _pickImage,
          icon: Icon(Icons.image),
          label: Text('Add A Image'),
          textColor: Theme.of(context).primaryColor,
        ),
      ],
    );
  }
}
