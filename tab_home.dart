import 'package:day20/tab_bar/page1.dart';
import 'package:day20/tab_bar/page2.dart';
import 'package:day20/tab_bar/page3.dart';
import 'package:flutter/material.dart';

class TabHome extends StatefulWidget {
  const TabHome({Key? key}) : super(key: key);

  @override
  State<TabHome> createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(12)),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TabBar(
                indicator: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(12)),
                //automaticIndicatorColorAdjustment: true,
                physics: NeverScrollableScrollPhysics(),
                controller: tabController,
                onTap: (index) {
                  setState(() {
                    tabController!.index = index;
                  });
                },
                tabs: [
                  Tab(
                    text: "Page1",
                  ),
                  Tab(
                    text: "Page2",
                  ),
                  Tab(
                    text: "Page3",
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                  physics: AlwaysScrollableScrollPhysics(),
                  controller: tabController,
                  children: [
                    Page1(),
                    Page2(),
                    Page3(),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
