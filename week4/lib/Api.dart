import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'ApiModel.dart';


class PicsumPhotosApi extends StatefulWidget {
  const PicsumPhotosApi({super.key});

  @override
  State<PicsumPhotosApi> createState() => _PicsumPhotosApiState();
}

class _PicsumPhotosApiState extends State<PicsumPhotosApi> {
  List<PicsumPhotosApiModel> picsumphotos = [];

  Future<List<PicsumPhotosApiModel>> getPicsumPhotosApi() async {
    var url = Uri.parse('https://picsum.photos/v2/list');
    final response = await http.get(url);
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        picsumphotos.add(PicsumPhotosApiModel.fromJson(i));
      }
      return picsumphotos;
    } else {
      return picsumphotos;
    }
  }

  @override
  void initState() {
    getPicsumPhotosApi();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PicsumPhotosApi'),
      ),
      body: FutureBuilder(
        future: getPicsumPhotosApi(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else if (snapshot.hasData && snapshot.data != null) {
            picsumphotos = snapshot.data!;
            return Expanded(
                child: ListView.builder(
                    itemCount: picsumphotos.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.all(8),
                        color: Colors.blueGrey,
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 200,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    20,
                                  ),
                                  // color: Colors.grey,
                                ),
                                child: CircleAvatar(
                                    backgroundImage: NetworkImage(snapshot
                                        .data![index].downloadUrl
                                        .toString())),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      "ID: ${picsumphotos[index].id.toString()}"),
                                  Text(
                                      "author: ${picsumphotos[index].author.toString()}"),
                                  Text(
                                      "width: ${picsumphotos[index].width.toString()}"),
                                  Text(
                                      "height: ${picsumphotos[index].height.toString()}"),
                                  // Text(
                                  //     "Url: \n ${picsumphotos[index].url.toString()}"),
                                ],
                              ),
                            ],

                          ),
                          // child: Image.network(picsumphotos[index].downloadUrl.toString())),

                          // Column(
                          //   children: [
                          //
                          //      if (picsumphotos[index].downloadUrl != null)
                          //        Image.network(picsumphotos[index].downloadUrl!),
                          //     Text(
                          //         "User ID: ${picsumphotos[index].id.toString()}"),
                          //     Text("ID: ${picsumphotos[index].author.toString()}"),
                          //     Text(
                          //         "Title:\n ${picsumphotos[index].width.toString()}"),
                          //     Text(
                          //         "Title:\n ${picsumphotos[index].height.toString()}"),
                          //      Text("Body:\n ${picsumphotos[index].url.toString()}"),
                          //     // Image.network(picsumphotos[4].url.toString()),
                          //     NetworkImage("Body:\n ${picsumphotos[index].url.toString()}"),
                          //   ],
                          // ),
                        ),
                      );
                    }));
          } else {
            return Text("No--Data");
          }
        },
      ),

      //   ],
      // ),
    );
  }
}
