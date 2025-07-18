/// id : "0"
/// author : "Alejandro Escamilla"
/// width : 5000
/// height : 3333
/// url : "https://unsplash.com/photos/yC-Yzbqy7PY"
/// download_url : "https://picsum.photos/id/0/5000/3333"

class PicsumPhotosApiModel {
  PicsumPhotosApiModel({
    String? id,
    String? author,
    num? width,
    num? height,
    String? url,
    String? downloadUrl,}){
    _id = id;
    _author = author;
    _width = width;
    _height = height;
    _url = url;
    _downloadUrl = downloadUrl;
  }

  PicsumPhotosApiModel.fromJson(dynamic json) {
    _id = json['id'];
    _author = json['author'];
    _width = json['width'];
    _height = json['height'];
    _url = json['url'];
    _downloadUrl = json['download_url'];
  }
  String? _id;
  String? _author;
  num? _width;
  num? _height;
  String? _url;
  String? _downloadUrl;
  PicsumPhotosApiModel copyWith({  String? id,
    String? author,
    num? width,
    num? height,
    String? url,
    String? downloadUrl,
  }) => PicsumPhotosApiModel(  id: id ?? _id,
    author: author ?? _author,
    width: width ?? _width,
    height: height ?? _height,
    url: url ?? _url,
    downloadUrl: downloadUrl ?? _downloadUrl,
  );
  String? get id => _id;
  String? get author => _author;
  num? get width => _width;
  num? get height => _height;
  String? get url => _url;
  String? get downloadUrl => _downloadUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['author'] = _author;
    map['width'] = _width;
    map['height'] = _height;
    map['url'] = _url;
    map['download_url'] = _downloadUrl;
    return map;
  }

}