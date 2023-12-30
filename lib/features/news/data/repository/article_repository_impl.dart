import 'dart:io';

import 'package:clean_arch/core/constants/constants.dart';
import 'package:clean_arch/core/resources/data_state.dart';
import 'package:clean_arch/features/news/domain/entitites/article.dart';
import 'package:dio/dio.dart';
import '../../domain/repository/article_repository.dart';
import '../data_sources/remote/news_api_service.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;

  ArticleRepositoryImpl(this._newsApiService);
  @override
  Future<DataState<List<ArticleEntity>>> getNewsArticle() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsApiKey,
        sources: sources,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioError(
            type: DioErrorType.response,
            requestOptions: httpResponse.response.requestOptions,
            error: httpResponse.response.statusMessage,
            response: httpResponse.response));
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
