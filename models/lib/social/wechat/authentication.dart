import 'package:json_annotation/json_annotation.dart';

part 'authentication.g.dart';

@JsonSerializable()
class OpenIdResponse {
  String scope;
  @JsonKey(name: 'access_token')
  String accessToken;
  @JsonKey(name: 'expires_in')
  String expiredIn;
  @JsonKey(name: 'refresh_token')
  String refreshToken;
  @JsonKey(name: 'openid')
  String openID;
  @JsonKey(name: 'unionid')
  String unionID;
  @JsonKey(name: 'errcode')
  String errCode;
  @JsonKey(name: 'errmsg')
  String errMsg;

  OpenIdResponse({
    this.accessToken,
    this.expiredIn,
    this.refreshToken,
    this.openID,
    this.unionID,
    this.errCode,
    this.errMsg,
  });

  factory OpenIdResponse.fromJson(Map<String, dynamic> json) => _$OpenIdResponseFromJson(json);

  static Map<String, dynamic> toJson(OpenIdResponse model) => _$OpenIdResponseToJson(model);
}

const WECHAT_AUTH_ERR_OK = 0;
const WECHAT_AUTH_ERR_AUTH_DENIED = -4;
const WECHAT_AUTH_ERR_USER_CANCEL = -2;
const WECHAT_AUTH_SCOPE_USERINFO = 'snsapi_userinfo';
