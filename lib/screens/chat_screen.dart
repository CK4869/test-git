import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_app_clone/constant.dart';
import 'package:instagram_app_clone/data/chat_json.dart';
import 'package:instagram_app_clone/screens/chat_detail_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context),
      body: getBody(context),
      bottomNavigationBar: getBottomBar(),
    );
  }

  PreferredSize getAppBar(context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: bgDark,
              ),
            ),
            const SizedBox(width: 5),
            const Text(
              'Chats',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.video_call_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit),
            )
          ],
        ),
      ),
    );
  }

  Widget getBody(context) {
    final screenSize = MediaQuery.of(context).size;
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
                  child: SizedBox(
                    height: 50,
                    width: screenSize.width / 2,
                    child: Center(
                      child: Text(
                        'Chats',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: (selectedIndex == 0)
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                  child: SizedBox(
                    height: 50,
                    width: screenSize.width / 2,
                    child: Center(
                      child: Text(
                        'Zooms',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: (selectedIndex == 1)
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: 1,
              width: double.infinity,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: bgGrey),
                ),
              ),
            ),
            IndexedStack(
              index: selectedIndex,
              children: [
                getChats(),
                getZooms(),
              ],
            )
          ],
        )
      ],
    );
  }

  Widget getChats() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
          child: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              color: bgGrey.withOpacity(.3),
              borderRadius: BorderRadius.circular(5),
            ),
            child: const TextField(
              cursorColor: bgGrey,
              decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ),
        Column(
          children: List.generate(
            chats.length,
            (index) => InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const ChatDetailScreen(),
                  ),
                );
              },
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage(chats[index]['profile'] as String),
                ),
                title: Text(chats[index]['username'] as String),
                subtitle: Text(
                    '${chats[index]['description']} - ${chats[index]['dateTime']}'),
                trailing: IconButton(
                  icon: const Icon(Icons.camera_alt),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget getZooms() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
        child: Column(
          children: [
            SvgPicture.asset(
              'assets/images/video.svg',
              width: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              "Video chat with Anymore",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Invite up to 50 people to join a video chat, even if they don't have Instagram or Messenger.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14, height: 1.5, color: textBlack.withOpacity(0.8)),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Create Zoom'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getBottomBar() {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgGrey.withOpacity(.1),
        border: Border(
          top: BorderSide(
            width: 1,
            color: bgGrey.withOpacity(.3),
          ),
        ),
      ),
      child: TextButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.camera_alt),
        label: const Text('Camera'),
      ),
    );
  }
}
