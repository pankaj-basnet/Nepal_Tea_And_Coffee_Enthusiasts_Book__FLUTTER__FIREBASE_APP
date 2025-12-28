import 'package:flutter/material.dart';
import 'package:nepal_tea_and_coffee/account_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController tabController;
  int tabCount = 4;
  // mainScreen

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabCount, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: '🍵 Nepal Tea & Coffee Enthusiast Group (NTCEG) ☕',),
      // appBar: AppBar(
      // title: Text('🍵 Nepal Tea & Coffee Enthusiast Group ☕'),
      // title: Text('🍵 Nepal Tea & Coffee Enthusiasts ☕'),
      // ),
      appBar: getAppBar(context),
      body: getSheetContent(context),

      bottomNavigationBar: getFloatingActionButton(context),
      // floatingActionButton: FloatingActionButton.small(onPressed: (){}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  PreferredSizeWidget getAppBar(BuildContext context) {
    return AppBar(
      // title: const Text('🍵 Nepal Tea & Coffee Enthusiasts ☕'),
      // title: const Text('🍵 Tea & Coffee Enthusiasts ☕'),
      title: const Text('Tea & Coffee Enthusiasts'),
      centerTitle: true,
    );
  }

  Widget getSheetContent(BuildContext context) {
    return TabBarView(
      physics: NeverScrollableScrollPhysics(),
      controller: tabController,
      children: [
        Stack(
          children: [
            AccountTab(),

            Positioned(child: Text('bottombanner'), bottom: 0),
          ],
        ),
        Text('2nd tab'),
        Text('3rd tab'),
        Text('4th tab'),
      ],
    );
  }

  Widget getFloatingActionButton(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      padding: EdgeInsets.all(5),
      child: SafeArea(
        child: TabBar(
          controller: tabController,
          labelPadding: EdgeInsets.zero,
          tabs: [
            Container(
              // padding: EdgeInsets.all(5.0),
              color: Colors.blue[600],
              child: TabItem(icon: Icons.home, text: 'home'),
            ),
            // Container(
            //   padding: EdgeInsets.all(5.0),
            //   color: Colors.blue[600],
            //   child: TabItem(icon: Icons.home, text: 'homeoooooo'),
            // ),
            Container(
              // margin: EdgeInsets.all(5),
              // padding: EdgeInsets.all(5.0),
              color: Colors.blue[600],
              child: TabItem(icon: Icons.search, text: 'search'),
            ),
            // TabItem(icon: Icons.search, text: 'search'),
            Container(
              color: Colors.cyanAccent,
              child: TabItem(icon: Icons.search, text: 'explore'),
            ),
            Container(
              // padding: EdgeInsets.only(bottom: 10),
              // margin: EdgeInsets.only(bottom: 10),
              color: Colors.cyanAccent,
              child: TabItem(icon: Icons.search, text: 're'),
            ),
            // Container(color: Colors.cyanAccent,child: TabItem(icon: Icons.search, text: 'reviews')),
          ],
        ),
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const TabItem({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    // return Tab(icon: Icon(icon), text: text);
    return Tab(icon: Icon(icon), child: Text(text));
  }
}
