

class Note {
  final int id;
  final String title;
  final String content;
  final String timestamp;

  Note({this.id, this.title, this.content, this.timestamp});

  factory Note.fromJson(Map<String, dynamic> json) => Note(
    id: json["id"],
    title: json["title"],
    content: json["content"],
    timestamp: json["timestamp"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "content": content,
  };

  @override
  String toString() {
    return title;
  }

}