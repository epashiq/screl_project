import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screl_project/provider/api_provider.dart';
import 'package:screl_project/view/login_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
          title: const Text(
            'FETCH API',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ));
              },
              icon: const Icon(Icons.logout),
              color: Colors.white,
            )
          ],
        ),
        body: SingleChildScrollView(
            child: ref.watch(apiProvider).isRefreshing
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : switch (ref.watch(apiProvider)) {
                    AsyncData(:final value) => Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: value!.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: ListTile(
                                  title: Text(
                                    value[index].title,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  subtitle: Text(value[index].body),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    AsyncError(:final error) => Center(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(error.toString()),
                              TextButton(
                                  onPressed: () {
                                    ref.invalidate(apiProvider);
                                  },
                                  child: const Text('try')),
                            ],
                          ),
                        ),
                      ),
                    _ => const Center(
                        child: CircularProgressIndicator(),
                      )
                  }),
      ),
    );
  }
}
