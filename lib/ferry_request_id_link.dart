library ferry_request_id_link;

import 'dart:async';

import 'package:ferry/ferry.dart';
import 'package:ferry_exec/ferry_exec.dart';
import 'package:uuid/uuid.dart';

class AddRequestIdTypedLink extends TypedLink {
  const AddRequestIdTypedLink();

  @override
  Stream<OperationResponse<TData, TVars>> request<TData, TVars>(
    OperationRequest<TData, TVars> request, [
    forward,
  ]) {
    final id = request.requestId ?? Uuid().v1();
    return forward != null
        ? forward(_requestWithId(request, id))
        : Stream.empty();
  }

  OperationRequest<TData, TVars> _requestWithId<TData, TVars>(
    OperationRequest<TData, TVars> request,
    String requestId,
  ) {
    return (request as dynamic).rebuild((b) => b..requestId = requestId);
  }
}
