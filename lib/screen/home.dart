import 'package:api_crud/model/usermodel.dart';
import 'package:api_crud/services/services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    postData(
                        Data(name: "Izhan", username: "Izzy", email: "izzy5"));
                  });
                },
                child: Text("POST DATA"))),
      ),
      body: FutureBuilder(
          future: getUser(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data.data[index].name),
                      subtitle: Text("${snapshot.data.data[index].id}"),
                      trailing: Wrap(
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  updataData(
                                      model: Data(
                                          name: "Update Izhan",
                                          email: "Update Izhan Gmail",
                                          username: "Update Izzy"),
                                      id: snapshot.data.data[index].id);
                                });
                              },
                              icon: Text("UPDATE")),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  deleteData(id: snapshot.data.data[index].id);
                                });
                              },
                              icon: Text("DELETE"))
                        ],
                      ),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
