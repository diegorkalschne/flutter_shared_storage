import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_shared_storage/services/shared_service.dart';
import 'package:flutter_shared_storage/shared_keys.dart';

void main() => runApp(const SharedStorageApp());

class SharedStorageApp extends StatelessWidget {
  const SharedStorageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Shared Storage App',
      home: const HomeScreenView(),
    );
  }
}

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  int counter = 0;

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      _recoveryData();
    });
  }

  void _recoveryData() async {
    //Recuperando valor do SharedPreferences
    int value = await SharedService.getInt(SharedKeys.counterValue) ?? 0;

    setState(() {
      counter = value;
    });
  }

  void _increment() async {
    setState(() {
      counter++;
    });

    //Armazenando o valor no Shared Preferences
    await SharedService.saveInt(SharedKeys.counterValue, counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Storage App'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        backgroundColor: Colors.grey[600],
        child: const Icon(Icons.add),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Counter',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '$counter',
              style: const TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
