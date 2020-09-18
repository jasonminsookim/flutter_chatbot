import 'package:flutter/material.dart';
import 'package:flutter_chatbot/ui/views/messaging/messaging_view.dart';
import 'package:flutter_chatbot/ui/views/onboarding/pageview_placeholder.dart';

class OnBoardPages extends StatefulWidget {
  @override
  _OnBoardPagesState createState() => _OnBoardPagesState();
}

class _OnBoardPagesState extends State<OnBoardPages> {
  int currentPageValue = 0;
  PageController _pageController;
  final List<Widget> onBoardPages = [
    PageviewPlaceholder(pageNum: 0),
    PageviewPlaceholder(pageNum: 1),
    PageviewPlaceholder(pageNum: 2),
    PageviewPlaceholder(pageNum: 3),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentPageValue);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget circleBar(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
          color: isActive
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }

  void getChangedPageAndMoveBar(int page) {
    currentPageValue = page;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        PageView.builder(
          physics: ClampingScrollPhysics(),
          itemCount: onBoardPages.length,
          onPageChanged: (int page) {
            getChangedPageAndMoveBar(page);
          },
          controller: _pageController,
          itemBuilder: (context, index) {
            return onBoardPages[index];
          },
        ),
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
                margin: EdgeInsets.only(bottom: 100),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < onBoardPages.length; i++)
                      if (i == currentPageValue) ...[circleBar(true)] else
                        circleBar(false),
                  ],
                ))
          ],
        ),
        Visibility(
            visible: currentPageValue == onBoardPages.length - 1 ? true : false,
            child: Container(
              margin: EdgeInsets.only(bottom: 25),
              width: 200,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MessagingView()));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(26))),
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: Text(
                  "Start chatting",
                  style: Theme.of(context).textTheme.button,
                ),
              ),
            )),
      ],
    )));
  }
}