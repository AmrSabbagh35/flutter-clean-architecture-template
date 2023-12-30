import 'package:clean_arch/core/resources/data_state.dart';
import 'package:clean_arch/core/usecase/usecase.dart';
import 'package:clean_arch/features/news/domain/entitites/article.dart';
import 'package:clean_arch/features/news/domain/repository/article_repository.dart';

class GetArticleUseCase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticle();
  }
}
