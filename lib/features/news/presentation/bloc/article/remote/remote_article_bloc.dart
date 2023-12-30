import 'package:clean_arch/core/resources/data_state.dart';
import 'package:clean_arch/features/news/domain/usecases/get_article.dart';
import 'package:clean_arch/features/news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:clean_arch/features/news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteArticlesBloc extends Bloc<RemoteArticlesEvent, RemoteArticleState> {
  final GetArticleUseCase _getarticleUseCase;
  RemoteArticlesBloc(this._getarticleUseCase)
      : super(const RemoteArticleLoading()) {
    on<GetArticles>(onGetArticles);
  }

  void onGetArticles(
      GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getarticleUseCase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticleDone(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(RemoteArticleError(dataState.error!));
    }
  }
}
