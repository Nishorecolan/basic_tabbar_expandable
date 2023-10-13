import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sample/colors.dart';
import 'package:flutter_bloc_sample/widgets.dart';

import 'cubit_bloc.dart';

class InvestmentScreen extends StatelessWidget {
  const InvestmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          elevation: 1,
          centerTitle: true,
          title: Text('Investments & Allocations',
              style: TextStyle(color: Colors.grey.shade800, fontSize: 16)),
          actions: [Image.asset('assets/question_mark.png')],
          bottom: const TabBar(
            labelColor: Color(0xff0D3C59),
            unselectedLabelColor: Color(0xff6C787F),
            tabs: [
              Tab(text: 'Investments'),
              Tab(text: 'Allocations'),
            ],
          ),
        ),
        body: BlocBuilder<CubitBloc, int>(
          builder: (context, value) {
            return const TabBarView(
              children: [Investments(), Allocations()],
            );
          },
        ),
      ),
    );
  }
}

class Investments extends StatelessWidget {
  const Investments({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 32),
              child: buildText(
                  name: 'Investments Allocation Options', fontSize: 16)),
          buildRowData(
              title: 'Total Accumulation Value', value: '\$100,843.90'),
          buildTransactionCard(isInvestments: true),
          buildTransactionCard(
              fundRiskPriority: 'MODERATE',
              fundRiskColor: AppColors.green,
              isInvestments: true),
          buildTransactionCard(
              fundRiskPriority: 'HIGH',
              fundRiskColor: AppColors.darkGreen,
              isInvestments: true),
          buildRowData(
              title: 'Total Accumulation Value', value: '\$100,843.90'),
          buildButton(buttonName: 'Modify Future Allocation of Premium'),
          buildContactText()
        ],
      ),
    );
  }
}

class Allocations extends StatelessWidget {
   const Allocations({super.key});

  @override
  Widget build(BuildContext context) {
    final cubitData = BlocProvider.of<CubitBloc>(context);

    return ListView.builder(
        key: Key(cubitData.selectedTile.toString()),
        itemBuilder: (context, index) {
          return buildExpansionTile(index, cubitData.selectedTile,
              name: cubitData.title[index],
              isDateVisible: cubitData.isDateDue[index],
              onExpansionChanged: (val) {
            if (val) {
              cubitData.updateSelectedTile(index);
            } else {
              cubitData.updateSelectedTile(-1);
            }
          });
        },
        itemCount: cubitData.title.length);
  }
}
