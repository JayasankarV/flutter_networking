import 'package:flutter/material.dart';

import '../model/media_details.dart';
import '../model/result.dart';
import '../network/remote_data_source.dart';

class GalleryHomeScreen extends StatefulWidget {
  const GalleryHomeScreen({super.key});

  @override
  State<GalleryHomeScreen> createState() => _GalleryHomeState();
}

class _GalleryHomeState extends State<GalleryHomeScreen> {
  final RemoteDataSource _apiResponse = RemoteDataSource();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gallery"),
      ),
      body: Center(
        child: FutureBuilder(
            future: _apiResponse.getImages(),
            builder: (BuildContext context, AsyncSnapshot<Result> snapshot) {
              if (snapshot.data is SuccessState) {
                List<MediaDetails> mediaList =
                    (snapshot.data as SuccessState).value;
                return GridView.builder(
                  itemCount: mediaList.length,
                  itemBuilder: (context, index) {
                    return mediaListItem(index, mediaList, context);
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      childAspectRatio: 0.75),
                  padding: const EdgeInsets.all(8),
                  shrinkWrap: true,
                );
              } else if (snapshot.data is ErrorState) {
                String errorMessage = (snapshot.data as ErrorState).msg;
                return Text(errorMessage);
              } else {
                return const CircularProgressIndicator();
              }
            }),
      ),
    );
  }

  Dismissible mediaListItem(
      int index, List<MediaDetails> mediaList, BuildContext context) {
    return Dismissible(
      background: Container(
        color: Colors.red,
      ),
      key: Key(mediaList[index].id),
      child: Card(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(mediaList[index].urls.regular),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(4))),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  mediaList[index].user.name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                child: Text(
                  "${mediaList[index].width} x ${mediaList[index].height}",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
