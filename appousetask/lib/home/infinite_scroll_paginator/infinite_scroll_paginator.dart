import 'dart:convert';
import 'package:appousetask/home/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:appousetask/home/widget/list_view.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class InfiniteScrollPaginatorDemo extends StatefulWidget {
  @override
  _InfiniteScrollPaginatorDemoState createState() =>
      _InfiniteScrollPaginatorDemoState();
}

class _InfiniteScrollPaginatorDemoState
    extends State<InfiniteScrollPaginatorDemo> {
  final _numberOfPostsPerRequest = 10;

  final PagingController<int, Data> _pagingController =
      PagingController(firstPageKey: 0);
  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final response = await get(Uri.parse("https://dummyjson.com/products"));
      List responseList = json.decode(response.body);
      List<Data> postList = responseList
          .map((data) => Data(data['id'], data['title'], data['category'],
              data['urlAvatar'], data['price']))
          .toList();
      final isLastPage = postList.length < _numberOfPostsPerRequest;
      if (isLastPage) {
        _pagingController.appendLastPage(postList);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(postList, nextPageKey);
      }
    } catch (e) {
      print("error --> $e");
      _pagingController.error = e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Appouse Task"),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () => Future.sync(() => _pagingController.refresh()),
        child: PagedListView<int, Data>(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<Data>(
            itemBuilder: (context, item, index) => Padding(
              padding: const EdgeInsets.all(15.0),
              child: DataItem(item.id, item.title, item.category,
                  item.urlAvatar, item.price),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
