import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatbot/ui/views/messaging/widgets/message_bubble.dart';
import 'package:flutter_chatbot/assets/assets.dart';

class ChatMessage extends StatelessWidget {
  ChatMessage(
      {this.text,
      this.name,
      this.type,
      this.id,
      this.index,
      this.feedback,
      this.timestamp,
      this.comment,
      this.selected});
  final String text;
  final String name;
  final bool type;
  final int id;
  final int index;
  final FieldValue timestamp;
  int feedback;
  String comment;
  bool selected;

  List<Widget> otherMessage(context) {
    return <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                MessageBubble(
                    text: text,
                    bubbleColor: Theme.of(context).colorScheme.primaryVariant,
                    textStyle: Theme.of(context).textTheme.bodyText2,
                    maxWidth: (2 * MediaQuery.of(context).size.width / 3) + 20),
                if (feedback != -1)
                  Positioned(
                      top: -5,
                      right: -5,
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).backgroundColor,
                        ),
                      )),
                if (feedback != -1)
                  Positioned(
                    top: -7.5,
                    right: -7.5,
                    child: Icon(
                      Cb.feedbackcheckpressed,
                      size: 25,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
              ],
              overflow: Overflow.visible,
            )
          ],
        ),
      ),
    ];
  }

  List<Widget> myMessage(context) {
    return <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
                child: MessageBubble(
              text: text,
              bubbleColor: Theme.of(context).colorScheme.primary,
              textStyle: Theme.of(context).textTheme.bodyText1,
              maxWidth: (2 * MediaQuery.of(context).size.width / 3) + 20,
            )),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: type ? myMessage(context) : otherMessage(context),
      ),
    );
  }
}

// child: Consumer<ChatModel>(builder: (context, chat, child) {
//                   return Row(
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           Provider.of<ChatModel>(context, listen: false)
//                               .changeSelected(index);
//                         },
//                         child: Bubble(
//                           child: Text(text),
//                           color: Color.fromRGBO(225, 225, 225, 1.0),
//                         ),
//                       ),
//                       if ((index == chat.getChatList().length - 1) | selected)
//                         IconButton(
//                           icon: FaIcon(
//                             FontAwesomeIcons.check,
//                             color: chat.getChatList()[index].feedback == 0
//                                 ? Colors.green
//                                 : Colors.grey,
//                           ),
//                           iconSize: 15,
//                           onPressed: () {
//                             Provider.of<ChatModel>(context, listen: false)
//                                 .giveFeedback(index, 0);
//                           },
//                         ),
//                       if ((index == chat.getChatList().length - 1) | selected)
//                         IconButton(
//                           icon: FaIcon(
//                             FontAwesomeIcons.times,
//                             color: chat.getChatList()[index].feedback == 1
//                                 ? Colors.red
//                                 : Colors.grey,
//                           ),
//                           iconSize: 15,
//                           onPressed: () {
//                             Provider.of<ChatModel>(context, listen: false)
//                                 .giveFeedback(index, 1);
//                           },
//                         ),
//                       if (((index == chat.getChatList().length - 1) |
//                               selected) &
//                           (chat.getChatList()[index].feedback != -1))
//                         IconButton(
//                           icon: FaIcon(
//                             FontAwesomeIcons.comment,
//                             color: chat.getChatList()[index].comment.isEmpty
//                                 ? Colors.grey
//                                 : Colors.lightBlue,
//                           ),
//                           iconSize: 15,
//                           onPressed: () {
//                             Provider.of<ChatModel>(context, listen: false)
//                                 .addComment(index);
//                           },
//                         )
//                     ],
//                   );
//                 })),
