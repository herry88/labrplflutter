import 'package:flutter/material.dart';
import 'package:labrpl/src/pages/pemrograman_web.dart';
import 'package:labrpl/src/pages/PemrogramanDasar.dart';

void main(){
  runApp(new MaterialApp(
    home: new MainMenu(),
    debugShowCheckedModeBanner: false,
  ));
}
class MainMenu extends StatelessWidget {
  final List<dynamic> pages = [
    MenuItem(title: "Pemrograman Web", icon: Icons.book, items: [
      SubMenuItem("HTML", Example01()),
      SubMenuItem("CSS", CSSHomepage()),
      SubMenuItem("JavaScript", JavaScriptHomePage()), 
    ]), 
    MenuItem(title: "Pemrograman Dasar", icon: Icons.computer, items: [
      SubMenuItem("C++", PemrogramanDasar()), 
      SubMenuItem("C#", CSharpPage()),
      SubMenuItem("Python", PythonPage()),
    ])
  ];
  @override
  Widget build(BuildContext context) => Drawer(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: Container(
              padding: EdgeInsets.only(top: 30.0),
              height: 100,
              color: Colors.deepOrange,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    'images/icon.png',
                    width: 20,
                  ),
                ),
                title: Text(
                  "Materi Jurusan RPL",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
              ),
            ),
          ),
          body: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              dynamic page = pages[index];
              return page is MenuItem
                  ? _buildExpandableMenu(page, context)
                  : _buildSubMenu(page, context);
            },
            itemCount: pages.length,
          ),
        ),
      );

  Widget _buildExpandableMenu(MenuItem page, BuildContext context) {
    return ExpansionTile(
      leading: Icon(page.icon),
      title: Text(
        "${page.title} (${page.items.length} layout)",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: page.hasChanges ? Colors.deepOrange : Colors.black87),
      ),
      children: _buildSubMenus(page.items, context),
    );
  }

  List<Widget> _buildSubMenus(List<SubMenuItem> items, BuildContext context) {
    final List<Widget> subMenus = [];
    items.forEach((item) => subMenus.add(_buildSubMenu(item, context)));
    return subMenus;
  }

  Widget _buildSubMenu(SubMenuItem item, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0),
      child: ListTile(
        leading: Icon(Icons.arrow_right, color: Colors.deepOrange),
        contentPadding: EdgeInsets.all(0),
        dense: false,
        isThreeLine: false,
        title: Text(
          item.title,
          style: Theme.of(context).textTheme.subhead.copyWith(
              color: item.hasChanges ? Colors.deepOrange : Colors.black87),
        ),
        onTap: () => _openPage(item.page, context),
      ),
    );
  }

  void _openPage(Object page, BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}
//Untuk SubMenuItem
class SubMenuItem {
  final String title;
  final Widget page;
  final IconData icon;
  final bool hasChanges;
  SubMenuItem(this.title, this.page,
      {this.icon = Icons.block, this.hasChanges = false});
}

//MenuItem
class MenuItem {
  final String title;
  final List<SubMenuItem> items;
  final IconData icon;
  final bool hasChanges;
  MenuItem(
      {Key key,
      @required this.title,
      this.items,
      this.icon = Icons.label_important,
      this.hasChanges = false});
}
