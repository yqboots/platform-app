import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment.g.dart';

@JsonSerializable()
class InitiatePaymentRequest {
  @JsonKey(name: 'appid')
  String appId;
  @JsonKey(name: 'partnerid')
  String partnerId;
  @JsonKey(name: 'prepayid')
  String prepayId;
  @JsonKey(name: 'package')
  String packageValue;
  @JsonKey(name: 'noncestr')
  String nonceStr;
  @JsonKey(name: 'timestamp')
  String timeStamp;
  String sign;

  InitiatePaymentRequest({
    @required this.appId,
    @required this.partnerId,
    @required this.prepayId,
    @required this.packageValue,
    @required this.nonceStr,
    @required this.timeStamp,
    @required this.sign,
  });

  factory InitiatePaymentRequest.fromJson(Map<String, dynamic> json) => _$InitiatePaymentRequestFromJson(json);

  static Map<String, dynamic> toJson(InitiatePaymentRequest model) => _$InitiatePaymentRequestToJson(model);
}
