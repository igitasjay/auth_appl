import 'dart:convert';

import 'package:auth_app/core/service/local_service/storage-service.dart';
import 'package:flutter/material.dart';

import '../../../locator.dart';
import '../../../utils/constant.dart';

//Todo: Go through this class
class UserService {
  late Locale myLocale;

  StorageService storageService = locator<StorageService>();
  bool? _token;
  String userType = "";

  //Todo: fix the user type
  // class PermissionTypes(str, Enum):
  // general_user_manager = "general_user_manager"
  // general_user = "general_user"
  // admin = "admin"
  // hr = "hr"

//Todo: understand how to use this getLocalUser

  // getLocalUser({EmployeeDetailsModel? user}) async {
  //   print(userCredentials.permissions);
  //   if (user != null) {
  //     userCredentials = user;
  //   } else {
  //     String? userVal = await storageService.readItem(key: currentUser);
  //     if (userVal == null || userVal == "null") {
  //     } else {
  //       userCredentials = EmployeeDetailsModel.fromJson(jsonDecode(userVal));
  //     }
  //   }
  //   String? value = await storageService.readItem(key: token);
  //
  //   _token = value != null ? true : false;
  // }
  //
  // //Todo: understand how to use this storeUser
  // storeUser(EmployeeDetailsModel? response) async {
  //   print("store user");
  //   await getLocalUser(user: response);
  //   storageService.storeItem(key: currentUser, value: jsonEncode(response));
  // }
  //
  // //Todo: I think this should be setUserPermissions
  // setUserType({String? type}) async {
  //   storageService.storeItem(key: userTypeData, value: type);
  //   await getUserType();
  // }
  //
  // getUserType() async {
  //   String? response = await storageService.readItem(key: userTypeData);
  //   userType = response ?? "";
  //   print(userType);
  // }

  //check if a user has a token
  bool get hasToken => _token ?? false;

  //check if user is loggedIn and verified
  bool get isLoggedIn => hasToken;

  //check if user credentials was cleared meaning user logged out completely
  // bool get hasCredentials => userCredentials.email != null;

  //Save List of Notifications
  // NotificationsResponse notificationsResponse = NotificationsResponse();

  //clear all user credentials
  resetAllCredentials() {
    // storageService.deleteItem(key: currentUser);
    storageService.deleteItem(key: accessToken);
    _token = null;
  }
}
