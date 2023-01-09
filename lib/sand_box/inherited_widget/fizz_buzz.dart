import 'package:flutter/material.dart';

class FizzBuzz extends StatefulWidget {
  const FizzBuzz({super.key});

  @override
  State<FizzBuzz> createState() => _FizzBuzzState();
}

class _FizzBuzzState extends State<FizzBuzz> {
  int _count = 1;

  @override
  Widget build(BuildContext context) {
    return _Inherited(
      message: _createMessage(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh),
          onPressed: () => setState(() => _count++),
        ),
        body: const Center(
          child: _Message(),
        ),
      ),
    );
  }

  String _createMessage() {
    final result = _count % 15 == 0
        ? 'FizzBuzz'
        : (_count % 3 == 0 ? 'Fizz' : (_count % 5 == 0 ? 'Buzz' : '-'));
    debugPrint('_count: $_count, result: $result');
    return result;
  }
}

class _Message extends StatelessWidget {
  const _Message();

  @override
  Widget build(BuildContext context) {
    debugPrint('_Message: rebuild');
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        const Text(
          '🐥',
          style: TextStyle(fontSize: 64),
        ),
        Text(
          'Message: ${_Inherited.of(
            context,
            listen: true, // 変更を監視する
          )?.message}',
          style: const TextStyle(fontSize: 64),
        ),
      ],
    );
  }
}

class _Inherited extends InheritedWidget {
  const _Inherited({
    required super.child,
    required this.message,
  });

  final String message;

  static _Inherited? of(
    BuildContext context, {
    required bool listen,
  }) =>
      listen
          ? context.dependOnInheritedWidgetOfExactType<_Inherited>()
          : context
              .getElementForInheritedWidgetOfExactType<_Inherited>()!
              .widget as _Inherited;

  @override
  bool updateShouldNotify(_Inherited oldWidget) => message != oldWidget.message;
}
