import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:appousetask/home/model/data_model.dart';
import 'package:appousetask/home/widget/list_view.dart';

class ScrollControllerDemo extends StatefulWidget {
  @override
  _ScrollControllerDemoState createState() => _ScrollControllerDemoState();
}

class _ScrollControllerDemoState extends State<ScrollControllerDemo> {
  late bool _isLastPage;
  late int _pageNumber;
  late bool _error;
  late bool _loading;
  late int _numberOfDatasPerRequest;
  late List<Data> _datas;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _pageNumber = 0;
    _datas = [];
    _isLastPage = false;
    _loading = true;
    _error = false;
    _numberOfDatasPerRequest = 10;
    _scrollController = ScrollController();
    fetchData();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  Future<void> fetchData() async {
    print("***");
    try {
      final response = await get(Uri.parse("https://dummyjson.com/products"));
      List responseList = json.decode(response.body);
      List<Data> dataList = responseList
          .map((data) => Data(data['id'], data['title'], data['category'],
              data['urlAvatar'], data['price']))
          .toList();

      setState(() {
        _isLastPage = dataList.length < _numberOfDatasPerRequest;
        _loading = false;
        _pageNumber = _pageNumber + 1;
        _datas.addAll(dataList);
      });
    } catch (e) {
      print("error --> $e");
      setState(() {
        _loading = false;
        _error = true;
      });
    }
  }

  Widget errorDialog({required double size}) {
    return SizedBox(
      height: 180,
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Gönderiler alınırken bir hata oluştu.',
            style: TextStyle(
                fontSize: size,
                fontWeight: FontWeight.w500,
                color: Colors.black),
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {
                setState(() {
                  _loading = true;
                  _error = false;
                  fetchData();
                });
              },
              child: const Text(
                "Tekrar Dene",
                style: TextStyle(fontSize: 20, color: Colors.white),
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      var nextPageTrigger = 0.8 * _scrollController.position.maxScrollExtent;

      if (_scrollController.position.pixels > nextPageTrigger) {
        _loading = true;
        fetchData();
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Appouse Task"),
        centerTitle: true,
      ),
      body: buildDatasView(),
    );
  }

  Widget buildDatasView() {
    if (_datas.isEmpty) {
      if (_loading) {
        return const Center(
            child: Padding(
          padding: EdgeInsets.all(8),
          child: CircularProgressIndicator(),
        ));
      } else if (_error) {
        return Center(child: errorDialog(size: 20));
      }
    }
    return ListView.builder(
        controller: _scrollController,
        itemCount: _datas.length + (_isLastPage ? 0 : 1),
        itemBuilder: (context, index) {
          if (index == _datas.length) {
            if (_error) {
              return Center(child: errorDialog(size: 15));
            } else {
              return const Center(
                  child: Padding(
                padding: EdgeInsets.all(8),
                child: CircularProgressIndicator(),
              ));
            }
          }

          final Data data = _datas[index];
          return Padding(
              padding: const EdgeInsets.all(15.0),
              child: DataItem(data.id, data.title, data.category,
                  data.urlAvatar, data.price));
        });
  }
}
