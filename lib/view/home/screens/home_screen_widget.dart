import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/app_spacing.dart';
import 'package:notes_app/app_style.dart';
import 'package:notes_app/app_text.dart';
import 'package:notes_app/repository/streams/streams.dart';
import 'package:notes_app/repository/user_data_repository.dart';
import 'package:notes_app/view/note/widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final FirebaseAuth user = FirebaseAuth.instance;
  final UserDataRepository userDataRepository = UserDataRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppStyle.bgColor,
      drawer: const MyDrawer(),
      appBar: AppBar(
        backgroundColor: AppStyle.bgColor,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => _scaffoldKey.currentState!.openDrawer(),
              child: getUserProfilePicture(userDataRepository, user),
            ),
          ],
        ),
        actions: const [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            homeScreenTitle,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        child: const Icon(Icons.person,
                            size: 24, color: Colors.blueAccent),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(12),
                                bottomLeft: Radius.circular(12))),
                        padding: const EdgeInsets.all(12),
                        child: const Text("Student"),
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        child: const Icon(Icons.person,
                            size: 24, color: Colors.blueAccent),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(12),
                                bottomLeft: Radius.circular(12))),
                        padding: const EdgeInsets.all(12),
                        child: const Text("Student"),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
