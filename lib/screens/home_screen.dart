import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_app_clone/constant.dart';
import 'package:instagram_app_clone/data/personal.dart';
import 'package:instagram_app_clone/data/new_feed_json.dart';
import 'package:instagram_app_clone/data/story_json.dart';
import 'package:instagram_app_clone/screens/chat_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context),
      body: getBody(),
    );
  }

  ListView getBody() {
    return ListView(
      children: [
        buildListStories(),
        const Divider(),
        Column(
          children: List.generate(
            newFeeds.length,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(width: 10),
                      Container(
                        width: 35,
                        height: 35,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: bgStoryColors,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 1, color: bgWhite),
                              image: DecorationImage(
                                image: NetworkImage(
                                    newFeeds[index]['profile'] as String),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        newFeeds[index]['username'] as String,
                        style: const TextStyle(
                          color: textBlack,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_vert),
                      )
                    ],
                  ),
                  Container(
                    height: 400,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            NetworkImage(newFeeds[index]['imageUrl'] as String),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            (newFeeds[index]['isLike'] as bool)
                                ? 'assets/images/heart_red.svg'
                                : 'assets/images/heart.svg',
                            width: 30,
                          ),
                        ),
                        const SizedBox(width: 5),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/images/comment.svg',
                            width: 30,
                          ),
                        ),
                        const SizedBox(width: 5),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/images/share.svg',
                            width: 30,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/images/bookmark.svg',
                            width: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${newFeeds[index]['likes']} likes',
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 5),
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: newFeeds[index]['username'].toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: textBlack,
                                  fontSize: 16,
                                ),
                              ),
                              TextSpan(
                                text: newFeeds[index]['caption'] as String,
                                style: const TextStyle(
                                  color: textBlack,
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          newFeeds[index]['comments'].toString(),
                          style: const TextStyle(
                            color: textGrey,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: const [
                            CircleAvatar(
                              radius: 15,
                              backgroundImage: NetworkImage(profile),
                            ),
                            SizedBox(width: 5),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Add a comment',
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                cursorColor: textGrey,
                              ),
                            ),
                            Text('😘'),
                            SizedBox(width: 5),
                            Text('😎'),
                            SizedBox(width: 5),
                            Icon(
                              Icons.add_circle_outline,
                              size: 20,
                            )
                          ],
                        ),
                        Text(
                          newFeeds[index]['dateTime'].toString(),
                          style: const TextStyle(fontSize: 12, color: textGrey),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  SingleChildScrollView buildListStories() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
      child: Row(
          children: List<Widget>.generate(
        stories.length,
        (index) => Container(
          margin: const EdgeInsets.all(3),
          width: 80,
          child: Column(
            children: [
              (stories[index]['isStory'] as bool)
                  ? Stack(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(colors: bgStoryColors),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(width: 2, color: bgWhite),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      stories[index]['imageUrl'] as String),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 1, color: bgGrey),
                              image: DecorationImage(
                                image: NetworkImage(
                                    stories[index]['imageUrl'] as String),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                          bottom: 0,
                          right: 5,
                          child: CircleAvatar(
                            radius: 10,
                            child: Center(
                              child: Icon(
                                Icons.add,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
              const SizedBox(height: 5),
              Text(
                stories[index]['username'] as String,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 12),
              )
            ],
          ),
        ),
      )),
    );
  }

  PreferredSize getAppBar(context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/logo.svg',
                width: 100,
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const ChatScreen(),
                    ),
                  );
                },
                icon: SvgPicture.asset(
                  'assets/images/facebook_messenger.svg',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
