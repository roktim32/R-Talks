import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('chats/l2sJ6p7u7dPe8cIK2Xf0/messages')
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.connectionState == ConnectionState.waiting)
              return Center(
                child: CircularProgressIndicator(),
              );

            final documents = streamSnapshot.data!.docs;
            return ListView.builder(
              // reverse: true,
              itemCount: documents.length,
              itemBuilder: (context, index) => Container(
                padding: EdgeInsets.all(8),
                child: Text(documents[index]['text']),
              ),
            );
          }),

      // StreamBuilder(
      //   stream: FirebaseFirestore.instance
      //       .collection('chats/lNeyzcWAw8rgY7Yaf7Mm/messages')
      //       .snapshots(),
      //   builder: (context, streamSnapshot) {
      //     return ListView.builder(
      //       itemCount: streamSnapshot.data!.docs.length,
      //       itemBuilder: (context, index) => Container(
      //         padding: EdgeInsets.all(8.0),
      //         child: Text('this works'),
      //       ),
      //     );
      //   },
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseFirestore.instance
              .collection('chats/l2sJ6p7u7dPe8cIK2Xf0/messages')
              .add({'text': 'This was added by clicking the button'});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
