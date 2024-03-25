import 'package:flutter/material.dart';
import 'package:maid/providers/session.dart';
import 'package:provider/provider.dart';

class SessionBusyOverlay extends StatefulWidget {
  final Widget child;

  const SessionBusyOverlay({super.key, required this.child});

  @override
  State<SessionBusyOverlay> createState() => _SessionBusyOverlayState();
}

class _SessionBusyOverlayState extends State<SessionBusyOverlay> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        if (context.watch<Session>().isBusy)
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.4),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
      ],
    );
  }
}