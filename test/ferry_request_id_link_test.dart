import 'package:test/test.dart';
import 'package:ferry_request_id_link/ferry_request_id_link.dart';

void main() {
  group('request', () {
    test(
      'should add a requestId to requests without a requestId',
      () async {
        // ARRANGE
        final link = AddRequestIdTypedLink();

        // ACT
        // final responseStream = link.request(request);

        // ASSERT
      },
    );

    test(
      'should not modify the requestId of request with an existing requestId',
      () async {
        // ARRANGE

        // ACT

        // ASSERT
      },
    );
  });
}
