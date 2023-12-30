import 'dart:io';

import 'package:clean_arch/core/constants/constants.dart';
import 'package:clean_arch/core/resources/data_state.dart';
import 'package:clean_arch/features/news/data/data_sources/remote/news_api_service.dart';
import 'package:clean_arch/features/news/domain/entitites/article.dart';
import 'package:dio/dio.dart';

abstract class ArticleRepository {
  final NewsApiService _newsApiService;

  ArticleRepository(this._newsApiService);

  Future<DataState<List<ArticleEntity>>> getNewsArticle() async {
    try {
      final httpRespose = await _newsApiService.getNewsArticles(
          apiKey: newsApiKey, sources: sources);

      if (httpRespose.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpRespose.data);
      } else {
        return DataFailed(DioError(
            error: httpRespose.response.statusMessage,
            response: httpRespose.response,
            requestOptions: httpRespose.response.requestOptions,
            type: DioErrorType.response));
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
