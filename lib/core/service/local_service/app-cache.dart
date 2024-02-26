import 'package:auth_app/core/service/local_service/storage-service.dart';

import '../../../locator.dart';

class AppCache {
  StorageService storageService = locator<StorageService>();

  String? fName;
  String? lastName;
  String? lName;
  String? email;
  String? id;
  String? companyName;
  int? companyStaff;
  String? adminIdd;
  String? jobTitle;
  String? currentPermission;

  bool? notify;
  String? token;

  clearRegisterData() {
    fName = null;
    lName = null;
    token = null;
    email = null;
  }
}
