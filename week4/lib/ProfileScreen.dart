// import 'package:flutter/material.dart';
// import 'package:week4/Api.dart';
// import 'ApiModel.dart';
//
// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});
//
//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileScreen> {
//   ApiCall api = ApiCall(); // Create the instance
//
//   @override
//   void initState() {
//     super.initState();
//     api.callapi(); // No need to redeclare `ApiCall api = ...`
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("ProfileScreen"),
//       ),
//       body: Column(
//         children: [
//           FutureBuilder<List<ApiModel>>(
//             future: api.callapi(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(child: CircularProgressIndicator());
//               } else if (snapshot.hasError) {
//                 return Center(child: Text("Error: ${snapshot.error}"));
//               } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                 return Center(child: Text("No data available."));
//               } else {
//                 final posts = snapshot.data!;
//                 return Expanded(
//                   child: ListView.builder(
//                     itemCount: posts.length,
//                     itemBuilder: (context, index) {
//                       final post = posts[index];
//                       return ListTile(
//                         title: Text(post.title ?? ''),
//                         subtitle: Text(post.url ?? ''),
//                       );
//                     },
//                   ),
//                 );
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
