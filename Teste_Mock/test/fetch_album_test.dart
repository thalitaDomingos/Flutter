import 'package:flutter_test/flutter_test.dart';
import 'package:teste_mock/main.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'fetch_album_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('fetchAlbum', () {
    test('returns an Album if the http call completes successfully', () async {
      final client = MockClient();

      // Usando o mockito para retornar uma resposta com sucesso
      when(client
              .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1')))
          .thenAnswer((_) async => http.Response(
              '{"userId": 1, "id": 1, "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit", "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"}',
              200));

      expect(await fetchAlbum(client),
          isA<Album>()); // Testando para ver se a requisicao retornou um objeto do tipo Album
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();

      // Testando o comportamento de um erro 404 NotFound
      when(client
              .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(
          fetchAlbum(client), throwsException); // Tratamento de erro (excessão)
    });
  });
}
