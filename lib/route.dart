import 'package:get/get.dart';
import 'package:wisehealthylife/screen/login/view/login_view_page.dart';
import 'package:wisehealthylife/common/provider/loading/view/loading.dart';
import 'package:wisehealthylife/screen/lobi/view/lobi.dart';

class GetXRoutes {
  static final routes = [
    GetPage(name: '/login', page: () => const LoginViewPage()),
    GetPage(name: '/loading', page: () => LoadingViewPage()),
    GetPage(name: '/lobi', page: () => Lobby()),
  ];
}