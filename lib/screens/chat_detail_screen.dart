import 'package:flutter/material.dart';
import 'package:instagram_app_clone/constant.dart';
import 'package:instagram_app_clone/data/chat_detail_json.dart';

class ChatDetailScreen extends StatelessWidget {
  const ChatDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context),
      body: getBody(context),
      bottomNavigationBar: getBottomBar(context),
    );
  }

  PreferredSize getAppBar(context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: SafeArea(
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            CircleAvatar(
              backgroundImage:
                  NetworkImage(chatDetails[0]['profile'] as String),
            ),
            const SizedBox(width: 8),
            const Text(
              'IU',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.videocam_sharp),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.info_outline),
            ),
          ],
        ),
      ),
    );
  }

  Widget getBody(context) {
    final screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: ListView(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        children: [
          Column(
            children: List.generate(
              chatDetails.length,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Row(
                  mainAxisAlignment: (chatDetails[index]['isMe'] as bool)
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    if (!(chatDetails[index]['isMe'] as bool))
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            chatDetails[index]['profile'] as String),
                      ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      constraints: BoxConstraints(
                        maxWidth: (screenSize.width - 20) * .6,
                      ),
                      decoration: BoxDecoration(
                        color: bgGrey.withOpacity(.3),
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(20),
                          topRight: const Radius.circular(20),
                          bottomLeft: (chatDetails[index]['isMe'] as bool)
                              ? const Radius.circular(20)
                              : const Radius.circular(0),
                          bottomRight: (chatDetails[index]['isMe'] as bool)
                              ? const Radius.circular(0)
                              : const Radius.circular(20),
                        ),
                      ),
                      child: Text(chatDetails[index]['message'] as String),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getBottomBar(context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        height: 50,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: bgGrey.withOpacity(.3),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              child: Icon(Icons.camera_alt),
            ),
            const SizedBox(width: 10),
            const Expanded(
              child: TextField(
                cursorColor: bgGrey,
                decoration: InputDecoration(
                  hintText: 'Message...',
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.mic_none),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.image_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.send_rounded),
            )
          ],
        ),
      ),
    );
  }
}
