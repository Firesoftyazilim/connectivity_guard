library connectivity_guard;

import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityGuardWidget extends StatefulWidget {
  final Widget child;
  final List<Widget>? actions;
  final Widget? title;
  final Widget? content;
  final bool isActive;

  ConnectivityGuardWidget({
    required this.child,
    Key? key,
    this.actions,
    this.title,
    this.content,
    this.isActive = true,
  }) : super(key: key);

  @override
  State<ConnectivityGuardWidget> createState() => _ConnectivityGuardWidgetState();
}

class _ConnectivityGuardWidgetState extends State<ConnectivityGuardWidget> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<List<ConnectivityResult>>? _subscription;
  bool _isConnected = true;

  @override
  void initState() {
    super.initState();
    _checkInitialConnection();
    _subscription = _connectivity.onConnectivityChanged.listen((result) {
      setState(() {
        _isConnected = result.first != ConnectivityResult.none;
      });
    });
  }

  Future<void> _checkInitialConnection() async {
    final result = await _connectivity.checkConnectivity();
    setState(() {
      _isConnected = result != ConnectivityResult.none;
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isConnected || !widget.isActive) {
      return widget.child;
    } else {
      return _buildNoConnectionDialog();
    }
  }

  Widget _buildNoConnectionDialog() {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.95,
          child: AlertDialog(
            title: widget.title ??  Text('No Internet',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
              textAlign: TextAlign.center,

            ),
            content:widget.content?? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.wifi_off,
                  size: 100,
                  color: Colors.grey,
                ),
                Text('Your internet connection seems to be offline. Please check your settings.',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            actions: widget.actions,
          ),
        ),
      ),
    );
  }

  void _retryConnection() async {
    final result = await _connectivity.checkConnectivity();
    setState(() {
      _isConnected = result != ConnectivityResult.none;
    });
  }
}
