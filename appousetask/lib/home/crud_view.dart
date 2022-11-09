import 'package:appousetask/home/home_view.dart';
import 'package:flutter/material.dart';

class CrudView extends StatefulWidget {
  const CrudView({super.key});

  @override
  State<CrudView> createState() => _CrudViewState();
}

int urunId = 5;
String urunTitle = "İphone X";

TextStyle titleStyle =
    TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);

TextStyle titleStyleColumn =
    TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold);

TextStyle subTitleStyle = TextStyle(
  color: Colors.white,
  fontSize: 20,
);

class _CrudViewState extends State<CrudView> {
  @override
  Widget build(BuildContext context) {
    var pageWidth = MediaQuery.of(context).size.width;
    var pageHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios),
          centerTitle: true,
          title: appBarTitle(),
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Stack(children: [
                Container(
                  width: pageWidth,
                  height: pageHeight / 4,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      )),
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      urunID(pageHeight, pageWidth),
                      urunTitleRow(pageHeight, pageWidth),
                      SizedBox(
                        height: pageHeight / 50,
                      ),
                      mainBody(pageWidth, pageHeight)
                    ]),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Text appBarTitle() {
    return Text(
      "Ürün Güncelleme / Oluşturma",
      style: TextStyle(color: Colors.white),
    );
  }

  Center mainBody(double pageWidth, double pageHeight) {
    return Center(
      child: Container(
        width: pageWidth / 1.1,
        height: pageHeight / 1.2,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: pageHeight / 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: pageHeight / 100, horizontal: pageWidth / 30),
            child: Text(
              "Ürün ID",
              style: titleStyleColumn,
            ),
          ),
          SizedBox(
            height: pageHeight / 15,
          ),
          Divider(
            thickness: 1,
          ),
          SizedBox(
            height: pageHeight / 50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: pageHeight / 100, horizontal: pageWidth / 30),
            child: Text(
              "Ürün Başlığı",
              style: titleStyleColumn,
            ),
          ),
          SizedBox(
            height: pageHeight / 50,
          ),
          Divider(
            thickness: 1,
          ),
          SizedBox(
            height: pageHeight / 50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: pageHeight / 100, horizontal: pageWidth / 30),
            child: Text(
              "Ürün Açıklaması",
              style: titleStyleColumn,
            ),
          ),
          SizedBox(
            height: pageHeight / 50,
          ),
          Divider(
            thickness: 1,
          ),
          SizedBox(
            height: pageHeight / 50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: pageHeight / 100, horizontal: pageWidth / 30),
            child: Text(
              "Fiyat",
              style: titleStyleColumn,
            ),
          ),
          SizedBox(
            height: pageHeight / 50,
          ),
          Divider(
            thickness: 1,
          ),
          SizedBox(
            height: pageHeight / 50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: pageHeight / 100, horizontal: pageWidth / 30),
            child: Text(
              "Kategori Seç",
              style: titleStyleColumn,
            ),
          ),
          SizedBox(
            height: pageHeight / 50,
          ),
          Divider(
            thickness: 1,
          ),
          SizedBox(
            height: pageHeight / 50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: pageHeight / 100, horizontal: pageWidth / 30),
            child: Text(
              "Ürün Resmi Yükle",
              style: titleStyleColumn,
            ),
          ),
          SizedBox(
            height: pageHeight / 50,
          ),
          Divider(
            thickness: 1,
          ),
          SizedBox(
            height: pageHeight / 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              saveButton(),
              deleteButton(),
            ],
          )
        ]),
      ),
    );
  }

  ElevatedButton deleteButton() {
    return ElevatedButton(
      onPressed: () {},
      child: Text("Sil"),
      style: ElevatedButton.styleFrom(
          minimumSize: Size(50, 40),
          backgroundColor: Colors.red,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
    );
  }

  ElevatedButton saveButton() {
    return ElevatedButton(
      onPressed: () {},
      child: Text("Kaydet"),
      style: ElevatedButton.styleFrom(
          minimumSize: Size(100, 40),
          backgroundColor: Colors.lightGreenAccent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
    );
  }

  Row urunTitleRow(double pageHeight, double pageWidth) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: pageHeight / 100, horizontal: pageWidth / 30),
          child: Text("Ürün Başlığı:", style: titleStyle),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: pageHeight / 100,
          ),
          child: Text(
            urunTitle,
            style: subTitleStyle,
          ),
        ),
      ],
    );
  }

  Row urunID(double pageHeight, double pageWidth) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: pageHeight / 100, horizontal: pageWidth / 30),
          child: Text("Ürün Id:", style: titleStyle),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: pageHeight / 100,
          ),
          child: Text(
            urunId.toString(),
            style: subTitleStyle,
          ),
        ),
      ],
    );
  }

  GestureDetector myCustomButton(Text text, pageWidth, pageHeight) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeView()),
        );
      },
      child: Container(
        width: pageWidth / 4,
        height: pageHeight / 20,
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(10)),
        child: Center(child: text),
      ),
    );
  }
}
