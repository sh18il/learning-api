import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wetherapp_api/model/user.dart';
import 'package:wetherapp_api/screens/view.dart';

import '../data/image_path.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: fetchUser,
      ),
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          final user = users[index];
          final email = user.email;
          final color = user.gender == 'male' ? Colors.blue : Colors.red;
          // final name = user['name']['first'];
          // final imageUrl = user.image;
          // final imageUrlL = user['picture']['large'];
          return ListTile(
            title: Text(
              email,
              style: TextStyle(color: Colors.white),
            ),
            tileColor: color,
            // leading: ClipRRect(child: Image.network(imageUrl)),
            subtitle: Text(user.phone),
            // trailing: IconButton(
            //     onPressed: () {
            //       Navigator.of(context).push(MaterialPageRoute(
            //           builder: (context) => viewScreen(
            //                 image: imageUrlL,
            //                 name: name,
            //               )));
            // },
            // icon: Icon(Icons.move_down)),
          );
        },
      ),
      // Container(
      //   padding: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
      //   height: double.infinity,
      //   width: double.infinity,
      //   decoration: BoxDecoration(
      //     image: DecorationImage(
      //       image: AssetImage(background[0]),
      //       fit: BoxFit.cover,
      //     ),
      //   ),
      //   child: Stack(
      //     children: [
      //       Container(
      //         height: 50,
      //         child:,
      //       )
      //     ],
      //   ),
      // ),
    );
  }

  fetchUser() async {
    print('fetch..');
    const url = 'https://randomuser.me/api/?results=400';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final transform = results.map((e) {
      return User(
          gender: e['gender'],
          phone: e['phone'],
          email: e['email'],
          cell: e['cell'],
          nat: e['nat'],
          image: e['picture']['thumbnail']);
    }).toList();

    setState(() {
      users = transform;
    });

    print('fetch user.....');
    print(json);
  }
}
