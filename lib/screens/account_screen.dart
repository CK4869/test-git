import 'package:flutter/material.dart';
import 'package:instagram_app_clone/constant.dart';
import 'package:instagram_app_clone/data/account_images_json.dart';
import 'package:instagram_app_clone/data/personal.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  PreferredSize getAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 10),
            const Icon(Icons.lock_outline),
            const SizedBox(width: 5),
            const Text(
              username,
              style: TextStyle(
                color: textBlack,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
            )
          ],
        ),
      ),
    );
  }

  Widget getBody() {
    final screenSize = MediaQuery.of(context).size;

    return ListView(
      padding: const EdgeInsets.only(top: 20),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 1,
                            color: bgGrey,
                          ),
                        ),
                        child: Stack(
                          children: const [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(profile),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 5,
                              child: CircleAvatar(
                                radius: 13,
                                child: Icon(Icons.add),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: const [
                                Text(
                                  '61',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text('Posts'),
                              ],
                            ),
                            Column(
                              children: const [
                                Text(
                                  '61',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text('Followers'),
                              ],
                            ),
                            Column(
                              children: const [
                                Text(
                                  '61',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text('Following'),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(instagramName),
                  const Text(instagramBio),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    width: screenSize.width - 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 1,
                        color: bgGrey,
                      ),
                    ),
                    child: const Center(
                      child: Text('Edit Profile'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Story Highlights',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.expand_more,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              color: bgGrey,
            ),
            Row(
              children: [
                Container(
                  width: screenSize.width * .5,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: (selectedIndex == 0)
                          ? const BorderSide(
                              width: 2,
                              color: bgDark,
                            )
                          : const BorderSide(
                              width: 1,
                              color: bgGrey,
                            ),
                    ),
                  ),
                  child: IconButton(
                    splashRadius: 20,
                    onPressed: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                    icon: Icon(
                      Icons.grid_view,
                      color: (selectedIndex == 0) ? bgDark : bgGrey,
                    ),
                  ),
                ),
                Container(
                  width: screenSize.width * .5,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: (selectedIndex == 1)
                          ? const BorderSide(
                              width: 2,
                              color: bgDark,
                            )
                          : const BorderSide(
                              width: 1,
                              color: bgGrey,
                            ),
                    ),
                  ),
                  child: IconButton(
                    splashRadius: 20,
                    onPressed: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    icon: Icon(
                      Icons.badge_outlined,
                      color: (selectedIndex == 1) ? bgDark : bgGrey,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 3),
            IndexedStack(
              index: selectedIndex,
              children: [
                buildListImages(screenSize, images),
                buildListImages(screenSize, imageWithTags),
              ],
            )
          ],
        )
      ],
    );
  }

  Wrap buildListImages(Size screenSize, List<String> images) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 3,
      runSpacing: 3,
      children: List.generate(
        images.length,
        (index) => Container(
          width: (screenSize.width - 6) / 3,
          height: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(images[index]),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
