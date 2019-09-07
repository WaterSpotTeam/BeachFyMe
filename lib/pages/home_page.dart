
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widget/fab_widget/fab.dart';
import '../widget/search_widget/search_modal.dart';
import '../widget/sliverAppBar.dart';
import 'tab_screens/beachsideCafeOrRestaurant_page.dart';
import 'tab_screens/camping_page.dart';
import 'tab_screens/equipment_page.dart';
import 'tab_screens/learningsCamps_page.dart';
import 'tab_screens/learningsSpots_page.dart';
import 'tab_screens/parking_page.dart';
import 'tab_screens/spots_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  TabController tabController;
  AnimationController _animationController;
  Animation<double> _animation;
  bool _isEnabled = true;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 7, vsync: this);
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
  }

  void _showSearchModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => SearchBottomModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: _isEnabled,
        bottom: _isEnabled,
        child: DefaultTabController(
          length: 7,
          child: Scaffold(
            body: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    elevation: 0.0,
                    pinned: true,
                    expandedHeight: 160.0,
                    forceElevated: innerBoxIsScrolled,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text('BeachfyMe'.toUpperCase()),
                      background: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          Image.asset('assets/images/holger.jpg',
                              fit: BoxFit.cover),
                        ],
                      ),
                    ),
                  ),
                  SliverPersistentHeader(
                    delegate: SliverAppBarDelegate(
                      TabBar(
                        isScrollable: true,
                        labelColor: Colors.black87,
                        unselectedLabelColor: Colors.white,
                        tabs: [
                          Tab(
                            icon: Icon(
                              Icons.home,
                            ),
                            text: 'Spots',
                          ),
                          Tab(
                            icon: Icon(
                              Icons.local_parking,
                            ),
                            text: 'Parking',
                          ),
                          Tab(
                            icon: Icon(
                              Icons.donut_small,
                            ),
                            text: 'Learnings Spots',
                          ),
                          Tab(
                            icon: Icon(
                              Icons.directions_subway,
                            ),
                            text: 'Learnings Camps',
                          ),
                          Tab(
                            icon: Icon(
                              Icons.restaurant,
                            ),
                            text: 'Beachside Cafe or Restaurant',
                          ),
                          Tab(
                            icon: Icon(
                              Icons.directions_subway,
                            ),
                            text: 'Camping',
                          ),
                          Tab(
                            icon: Icon(
                              Icons.directions_subway,
                            ),
                            text: 'Equipment',
                          ),
                        ],
                      ),
                    ),
                    pinned: true,
                  ),
                ];
              },
              body: TabBarView(
                children: [
                  SpotsPage(),
                  ParkingPage(),
                  LearningsSpotsPage(),
                  LearningsCampsPage(),
                  BeachsideCafeOrRestaurantPage(),
                  CampingPage(),
                  EquipmentPage(),
                ],
              ),
            ),
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(right: 18.0, bottom: 18.0),
              child: ExpandedAnimationFab(
                items: [
                  FabItem(
                    "Logout",
                    Icons.lock,
                    onPress: () {
                      _animationController.reverse();
                    },
                  ),
                  FabItem(
                    "Settings",
                    Icons.settings,
                    onPress: () {
                      _animationController.reverse();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ParkingPage()));
                    },
                  ),
                  FabItem(
                    "Add a Spot",
                    Icons.add_box,
                    onPress: () {
                      _animationController.reverse();
                    },
                  ),
                  FabItem(
                    "Search",
                    Icons.search,
                    onPress: () {
                      _animationController.reverse();
                      _showSearchModal();
                    },
                  ),
                ],
                animation: _animation,
                onPress: () {
                  if (_animationController.isCompleted) {
                    _animationController.reverse();
                  } else {
                    _animationController.forward();
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
