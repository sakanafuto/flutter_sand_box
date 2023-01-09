import 'package:flutter/material.dart';
import 'package:flutter_sand_box/sand_box/inherited_widget/fizz_buzz.dart';

import 'sand_box/inherited_widget/inherited_widget_page.dart';
import 'sand_box/myapp.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FizzBuzz(),
    );
  }
}
