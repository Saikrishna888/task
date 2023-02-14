import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var filterValue = "name";
  final CollectionReference _userLists = FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Users List"),
        actions: [
          PopupMenuButton(
          // add icon, by default "3 dot" icon
          // icon: Icon(Icons.book)
          itemBuilder: (context){
            return [
                  PopupMenuItem<String>(
                      value: 'name',
                      child: Text("Name"),
                  ),

                  PopupMenuItem<String>(
                      value: 'age',
                      child: Text("Age"),
                  ),

                  PopupMenuItem<String>(
                      value: 'location',
                      child: Text("Location"),
                  ),
              ];
          },
          onSelected:(value){
            setState(() {
              filterValue = value;
            });
            if(value == 0){
                print("My Name menu is selected.");
            }else if(value == 1){
                print("Age menu is selected.");
                  
            }else if(value == 2){
                print("Location menu is selected.");
            }
          }
        )
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').orderBy(filterValue, descending: false ).snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot){
          if(streamSnapshot.hasData){

            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context,index){
                final DocumentSnapshot documentSnapshot =
                        streamSnapshot.data!.docs[index];
                return SingleChildScrollView(
                  child: Container(
                    child: Card(
                      child: ListTile(
                        leading: Icon(Icons.person),
                        title: Text(
                          "${documentSnapshot['name']}",
                            style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                          ),
                          subtitle: Text(
                            "${documentSnapshot['location']}"
                          ),
                          trailing: Text(
                            "${documentSnapshot['age']}"
                          ),
                      ),
                    ),
                  ),
                );
              }
              
              );
          } else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )
    );
  }
}