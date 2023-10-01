import 'package:flutter/material.dart';
import 'package:riverpod_/screens/changenotifier_page.dart';
import 'package:riverpod_/screens/futureprovider_page.dart';
import 'package:riverpod_/screens/provider_page.dart';
import 'package:riverpod_/screens/statenotifier_page.dart';
import 'package:riverpod_/screens/stateprovider_page.dart';
import 'package:riverpod_/screens/steamprovider_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Explore Providers"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ProviderPage()));
                },
                child: Text("Provider"),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>StateProviderPage()));
                },
                child: Text("StateProvider"),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>FutureProviderPage()));
                },
                child: Text("FutureProvider"),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>SteamProviderPage()));
                },
                child: Text("SteamProvider"),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangeNotifierPage()));
                },
                child: Text("ChangeNotifierProvider"),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>StateNotifierPage()));
                },
                child: Text("StateNotifierProvider"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
