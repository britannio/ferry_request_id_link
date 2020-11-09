library ferry_request_id_link;

import 'dart:async';

import 'package:ferry/ferry.dart';
import 'package:ferry_exec/ferry_exec.dart';
import 'package:uuid/uuid.dart';

typedef RequestCallback = void Function(OperationRequest);
typedef ResponseCallback = void Function(OperationResponse);

class RequestIdLink extends TypedLink {
  const RequestIdLink();

  @override
  Stream<OperationResponse<TData, TVars>> request<TData, TVars>(
    OperationRequest<TData, TVars> request, [
    forward,
  ]) {
    final id = request.requestId ?? Uuid().v4();
    return forward(_requestWithId(request, id));
  }

  OperationRequest<TData, TVars> _requestWithId<TData, TVars>(
    OperationRequest<TData, TVars> request,
    String requestId,
  ) {
    return (request as dynamic).rebuild((b) => b..requestId = requestId);
  }
}
