import 'package:flutter/material.dart';

class InheritedWidgetPage extends StatelessWidget {
  const InheritedWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _Inherited(
      message: '🦈',
      child: Scaffold(body: Center(child: _Message())),
    );
  }
}

class _Message extends StatelessWidget {
  const _Message();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Message: ${_Inherited.of(context, listen: false)?.message}',
      style: const TextStyle(fontSize: 96),
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
  bool updateShouldNotify(_Inherited oldWidget) => true;
}
