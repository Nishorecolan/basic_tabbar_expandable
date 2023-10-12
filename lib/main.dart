import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit_bloc.dart';
import 'investment.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
          create: (BuildContext context) => CubitBloc(),
          child: const InvestmentScreen()),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubitData = BlocProvider.of<CubitBloc>(context);

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: BlocBuilder<CubitBloc, int>(
            builder: (context, cubitValue) {
              return cubitData.selectedIndex == 2
                  ? const Text('')
                  : AppBar(
                      title: cubitData.selectedIndex == 0
                          ? const Text('Home Screen')
                          : const Text('First Screen'),
                      leading: cubitData.selectedIndex == 1
                          ? IconButton(
                              icon: const Icon(Icons.arrow_back),
                              onPressed: () => cubitData.updateIndex(0))
                          : null,
                      actions: const [
                        Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(Icons.notifications),
                        )
                      ],
                    );
            },
          ),
        ),
        body: BlocBuilder<CubitBloc, int>(builder: (context, cubit) {
          return cubitData.selectedIndex == 0
              ? FirstScreen(cubitData: cubitData)
              : cubitData.selectedIndex == 1
                  ? SecondScreen(cubitData: cubitData)
                  : const Center(child: Text('Last Screen'));
        }));
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key, required this.cubitData});

  final CubitBloc cubitData;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text("Next"),
        onPressed: () {
          cubitData.updateIndex(1);
        },
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key, required this.cubitData});

  final CubitBloc cubitData;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: const Text("Previous"),
            onPressed: () {
              cubitData.updateIndex(0);
            },
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            child: const Text("Next"),
            onPressed: () {
              cubitData.updateIndex(2);
            },
          ),
        ],
      ),
    );
  }
}
