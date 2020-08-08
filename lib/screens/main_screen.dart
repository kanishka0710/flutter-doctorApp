import "package:flutter/material.dart";
import "package:doctorApp/config/palette.dart";
import "package:doctorApp/config/styles.dart";
import "package:doctorApp/screens/screens.dart";
import "package:doctorApp/customWidgets/appBar.dart";
import "package:doctorApp/config/data.dart";
import 'package:flutter/rendering.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _selected = "Doctor";

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        bottomNavigationBar: BottomNavScreen(),
        //appBar: CustomAppBar(),
        body: CustomScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          slivers: <Widget>[
            _buildHeader(_screenHeight),
            _buildNeedCards(_screenHeight),
            _buildNewsHeader(_screenHeight),
            _buildNews(_screenHeight),
          ],
        ));
  }

  SliverToBoxAdapter _buildHeader(double screenHeight) {
    return SliverToBoxAdapter(
        child: Container(
            height: .28 * screenHeight,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Palette.primaryBlue,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("HealthBag",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: Colors.white)),
                    IconButton(
                      icon: Icon(Icons.notifications,
                          color: Colors.white, size: 28),
                      onPressed: () {},
                    )
                  ],
                ),
                SizedBox(height: .03 * screenHeight),
                Row(
                  children: <Widget>[
                    Container(
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                child: TextField(
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Search Doctors, Clinics',
                                      hintStyle: TextStyle(
                                        color: Colors.grey[700],
                                      )),
                                ))
                          ],
                        )),
                    SizedBox(width: 10),
                    Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Palette.primaryRed,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child:
                            Icon(Icons.search, color: Colors.white, size: 32))
                  ],
                ),
              ],
            )));
  }

  SliverToBoxAdapter _buildNeedCards(double screenHeight) {
    return SliverToBoxAdapter(
        child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("What do you need?",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    )),
                SizedBox(height: screenHeight * .02),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: needsOne
                        .map((e) => GestureDetector(
                              onTap: () {
                                setState(() => _selected = e.values.first);
                                print(e.values.first + " has been selected");
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                height: 110,
                                width: 110,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: _selected == e.values.first
                                      ? Palette.primaryRed
                                      : Colors.grey[100],
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Image.asset(e.keys.first,
                                        height: screenHeight * .06),
                                    SizedBox(height: screenHeight * .018),
                                    Text(e.values.first,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: _selected == e.values.first
                                              ? Colors.white
                                              : Colors.black,
                                        ))
                                  ],
                                ),
                              ),
                            ))
                        .toList()),
                SizedBox(height: screenHeight * .015),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: needsTwo
                        .map((e) => GestureDetector(
                              onTap: () {
                                setState(() => _selected = e.values.first);
                                print(e.values.first + " has been selected");
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                height: 110,
                                width: 110,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: _selected == e.values.first
                                      ? Palette.primaryRed
                                      : Colors.grey[100],
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Image.asset(e.keys.first,
                                        height: screenHeight * .06),
                                    SizedBox(height: screenHeight * .018),
                                    Text(e.values.first,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: _selected == e.values.first
                                              ? Colors.white
                                              : Colors.black,
                                        ))
                                  ],
                                ),
                              ),
                            ))
                        .toList())
              ],
            )));
  }

  SliverToBoxAdapter _buildNewsHeader(double screenHeight) {
    return SliverToBoxAdapter(
        child: Container(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Health Articles",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
          Text("See all",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
        ],
      ),
    ));
  }

  SliverToBoxAdapter _buildNews(double screenHeight) {
    return SliverToBoxAdapter(
        child: Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      height: 168, 
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: newsArticles.length,
        itemBuilder: (context, index) {
          return _buildNewsCard(index);
        },
      ),
    ));
  }

  _buildNewsCard(int index) {
    return Container(
      width: 320,
      margin: const EdgeInsets.only(right: 20, left: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.blue,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(newsArticles[index].keys.first, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white)),
              Icon(Icons.bookmark_border, color: Colors.white, size: 26,)
            ],
          ),
          SizedBox(height: 25),
          Text(newsArticles[index].values.first.keys.first, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white,)),
          SizedBox(height: 10),
          Text(newsArticles[index].values.first.values.first, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white70))
        ],
      ),
    );
  }
}
