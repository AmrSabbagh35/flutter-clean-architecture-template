import 'package:clean_arch/features/news/data/data_sources/remote/news_api_service.dart';
import 'package:clean_arch/features/news/data/repository/article_repository_impl.dart';
import 'package:clean_arch/features/news/domain/repository/article_repository.dart';
import 'package:clean_arch/features/news/domain/usecases/get_article.dart';
import 'package:clean_arch/features/news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

var sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(Dio());

  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));

  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  sl.registerFactory<RemoteArticlesBloc>(() => RemoteArticlesBloc(sl()));
}
