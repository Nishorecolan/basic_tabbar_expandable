import 'package:flutter/material.dart';
import 'package:flutter_bloc_sample/widgets.dart';

class InvestmentScreen extends StatelessWidget {
  const InvestmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back,color: Colors.black,),
          backgroundColor: Colors.white,
          elevation: 1,
          centerTitle: true,
          title: Text('Investments & Allocations',style: TextStyle(color: Colors.grey.shade800,fontSize: 16)),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right:8.0),
              child: CircleAvatar(
                radius: 12,
                child: Icon(Icons.question_mark,size: 15),
              ),
            )
          ],
          bottom: TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'Investments'),
              Tab(text: 'Allocations'),
            ],
          ),
        ),

        body: TabBarView(
          children: [
            Investments(),
            Allocations()
          ],
        )
      ),
    );
  }
}

class Investments extends StatelessWidget {
  const Investments({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

      ],
    );
  }
}

class Allocations extends StatelessWidget {
  const Allocations({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context,index) {
      return ExpansionTile(
        title: buildText(name:'Current Premium Allocation'),
        children: [
          Divider(color: Colors.grey.shade700),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                buildText(name:'Total Allocation'),
                Spacer(),
                buildText(name: '100%')
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(height: 170,color: Colors.red),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(height: 170,color: Colors.blue),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                buildText(name:'Total Allocation'),
                Spacer(),
                buildText(name: '100%')
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: (){},
              child: buildText(name: 'Reallocate Funds',fontColor: Colors.white),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(16.0),
              child:
              buildText(name: 'Generally there is a maximum of three verbal and/or electronic trades allowed in a rolling 60 day timeframe before being resurfaced to requests via regular or overnight mail for one year. \n\nPlease see your prospectus, contact your registered representative, or call 1-800-598-2019 for details. To access investments division daily unit values, performance summaries, and to download a prospectus please click here.',fontSize: 14,fontWeight: FontWeight.w400))
        ],

      );
    },itemCount: 10);
  }
}


