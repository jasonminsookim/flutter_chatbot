import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  MessageModel(
      {this.text,
      this.type,
      this.index,
      this.feedback,
      this.detail,
      this.timestamp,
      this.comment,
      this.selected,
      this.consecutive});
  String text;
  bool type;
  int index;
  FieldValue timestamp;
  int feedback;
  int detail;
  String comment;
  bool selected;
  bool consecutive;
}