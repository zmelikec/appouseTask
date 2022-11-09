// import 'package:appousetask/core/auth_manager.dart';
// import 'package:appousetask/core/cache_manager.dart';
import 'package:appousetask/core/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:appousetask/home/widget/list_view.dart';
import 'package:appousetask/home/infinite_scroll_paginator/infinite_scroll_paginator.dart';

PageStorageKey pageStorageKey = const PageStorageKey("pageStorageKey");
final PageStorageBucket pageStorageBucket = PageStorageBucket();

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with CacheManager {
  ScrollController? scrollController;

  @override
  void initState() {
    super.initState();
  }

  String token = '';

  Future<void> getTokenCache() async {
    token = await getToken() ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: InfiniteScrollPaginatorDemo());
  }
}
