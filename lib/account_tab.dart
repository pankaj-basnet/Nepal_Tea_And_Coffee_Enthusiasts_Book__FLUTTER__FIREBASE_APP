import 'package:flutter/material.dart';

class AccountTab extends StatefulWidget {
  const AccountTab({super.key});

  @override
  State<AccountTab> createState() => _AccountTabState();
}

class _AccountTabState extends State<AccountTab> {
  // late TabController tabController;

  final PageController _pageController = PageController();

  // List<double?> _heights = [50, 80];
  // int currentpage = 0;

  //  double? get _currentHeight => _heights[currentpage];

  int _currentPage = 0;
  // final List<double> _heights = [150, 100];
  final List<double> _heights = [40, 60];

  @override
  void initState() {
    super.initState();
    //  tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 10,
          bottom: 80,
        ),
        child: Column(
          children: [
            GroupInfo(),
            // SizedBox(height: 200),
            // Expanded(child: Text('Upcoming event: Cupping Ethiopian Coffee')),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),

              // ERROR by dart linter/compiler // The method 'withValues' can't be unconditionally invoked because the receiver can be 'null'.
              // Try making the call conditional (using '?.') or adding a null check to the target ('!')
              // color: Colors.brown[400]?.withValues(alpha: 0.1),
              decoration: BoxDecoration(
                color: Colors.brown[400]?.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
              ),

              child: Wrap(
                children: [
                  Text('Upcoming event: Cupping 10 Ethiopian farm\'s Coffee'),
                ],
              ),
            ),
            // Expanded(
            //   flex: 1,
            //   child: Row(
            //     children: [
            //       Text('Upcoming event: Cupping Ethiopian Coffee'),
            //       Text('data'),
            //     ],
            //   ),
            // ),
            MenuWidgetWallet(),

            DefaultTabController(
              length: 2,
              child: Builder(
                builder: (context) => Column(
                  // child: Column(
                  children: [
                    TabBar(
                      tabs: [Text('COFFEE'), Text('TEA')],
                      onTap: (index) {
                        // tabController.animateTo(index);
                        // _pageController.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.easeInOutBack);

                        // _pageController.jumpToPage(index);

                        _pageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),

                    SizedBox(
                      height: 200,

                      //       TweenAnimationBuilder<double>(
                      // curve: Curves.easeInOutCubic,
                      // duration: const Duration(milliseconds: 100),
                      // tween: Tween<double>(begin: _heights[0], end: _currentHeight),
                      // builder: (context, value, child) =>
                      //     SizedBox(height: value, child: child),
                      // child:
                      child: TweenAnimationBuilder(
                        duration: const Duration(milliseconds: 900),
                        curve: Curves.easeInOutCubic,

                        // tween: Tween<double>(begin: _heights[0], end: _currentHeight),
                        // tween: Tween<double>(begin: 0.3, end: 0.8),
                        // tween: Tween<double>(begin: 75, end: 125),
                        // tween: Tween<double>(begin: 75, end: _currentHeight),
                        tween: Tween<double>(
                          // begin: _heights[0],
                          begin: 50,

                          end: _heights[_currentPage],
                        ),

                        builder: (context, value, child) =>
                            SizedBox(height: value, child: child),
                        child: PageView(
                          physics: NeverScrollableScrollPhysics(),
                          controller: _pageController,

                          // onPageChanged: (index) {

                          //   DefaultTabController.of(context).animateTo(index);

                          //   currentpage = index;
                          // },
                          onPageChanged: (index) {
                            setState(() => _currentPage = index);
                            DefaultTabController.of(context).animateTo(index);
                          },

                          children: [
                            // Center(child: Container(height: 150,color: Colors.amber, child: Text('COFFEE'))),
                            Center(
                              child: Container(
                                height: 150,
                                color: Colors.amber[900],
                                child: Text(
                                  'COFFEE   OOO   COFFEE   OOO   COFFEE   OOO   COFFEE   OOO   COFFEE   OOO   ',
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                height: 100,
                                color: Colors.blue[900],
                                child: Text(
                                  'TEA   OOO   TEA   OOO TEA   OOO   TEA   OOO     TEA   OOO   TEA   OOO   TEA   OOO   ',
                                ),
                              ),
                            ),
                            // Center(child: Text('TEA')),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GroupInfo extends StatelessWidget {
  const GroupInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      // margin: EdgeInsets.symmetric(vertical: 10),
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.grey[600],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blueAccent),
      ),
      child: Column(
        children: [
          Text('Number of Groups', style: TextStyle(fontSize: 16)),
          // SizedBox(height: 10),
          Text(
            '20',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: 160,
            color: Colors.grey[800],
            child: Text(
              'Total Tea and Coffee Enthusiast members : \n219',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class MenuWidgetWallet extends StatelessWidget {
  const MenuWidgetWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _MenuButton(icon: Icons.search, text: 'search'),
          _MenuButton(icon: Icons.coffee_maker_rounded, text: 'receipes'),
          _MenuButton(icon: Icons.filter_drama, text: 'event'),
          _MenuButton(icon: Icons.support, text: 'suggestion'),
        ],
      ),
    );
  }
}

class _MenuButton extends StatelessWidget {
  final IconData icon;
  final String text;
  const _MenuButton({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blueAccent[700],
      child: Column(
        children: [
          Container(
            // color: Colors.blueAccent,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              // doesnot work
              // color: Colors.purpleAccent[600],
              color: Colors.purple[600],
              borderRadius: BorderRadius.circular(10),
            ),

            child: Icon(icon, size: 24),
          ),
          SizedBox(height: 8),
          Text(text, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

// D:\src_dev\flutter\FLUTTER-PRACTICE-PROJECTS-2026-\SMALL-\PROJECTS-\nepal_tea_and_coffee\lib\account_tab.dart
