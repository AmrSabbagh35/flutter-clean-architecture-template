import 'package:clean_arch/features/news/domain/entitites/article.dart';

class ArticleModel extends ArticleEntity {
  const ArticleModel({
    int? id,
    String? title,
    String? author,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    return ArticleModel(
        author: map['author'] ?? "",
        content: map['content'] ?? "",
        description: map['description'] ?? "",
        id: map['id'] ?? "",
        publishedAt: map['publishedAt'] ?? "",
        title: map['title'] ?? "",
        url: map['url'] ?? "",
        urlToImage: map['urlToImage'] ?? "");
  }
}
