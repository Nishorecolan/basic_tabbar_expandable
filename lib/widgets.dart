import 'package:flutter/material.dart';

import 'colors.dart';

buildText(
    {String name = '',
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w400,
    String fontFamily = 'Effra',
    Color fontColor = Colors.black}) {
  return Text(name,
      overflow: TextOverflow.clip,
      style: TextStyle(
          fontFamily: fontFamily,
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: fontColor));
}

buildExpansionTile(index,selectedIndex,{String name = '', bool isDateVisible = false,onExpansionChanged}) {
  return Padding(
    padding: const EdgeInsets.only(top: 0.0, bottom: 8),
    child: ExpansionTile(
      key: Key(index.toString()),
     initiallyExpanded: index == selectedIndex,
      onExpansionChanged: onExpansionChanged,
      title:
          buildText(name: name, fontColor: AppColors.coolBlack, fontSize: 16),
      children: [
        Divider(color: Colors.grey.shade700),
        if (isDateVisible) ...[
          buildRowData(title: 'Frequency', value: 'Quarterly'),
          buildRowData(title: 'Next Allocation Date', value: '11/08/2023')
        ],
        buildRowData(title: 'Total Allocation', value: '100%'),
        buildTransactionCard(),
        buildTransactionCard(),
        buildRowData(title: 'Total Allocation', value: '100%'),
        buildButton(buttonName: 'Reallocate Funds'),
        buildContactText(),
      ],
    ),
  );
}

buildRowData({String title = '', value = ''}) {
  return Padding(
    padding: const EdgeInsets.only(top: 24.0, left: 16, right: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildText(name: title, fontColor: AppColors.gray80),
        buildText(name: value, fontColor: AppColors.coolBlack, fontSize: 16)
      ],
    ),
  );
}

buildTransactionCard(
    {String fundRiskPriority = 'LOW',
    Color? fundRiskColor,
    bool isInvestments = false}) {
  return Padding(
    padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
    child: Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: const [
            BoxShadow(color: Colors.grey, spreadRadius: 0, blurRadius: 5)
          ],
          border: Border.all(color: AppColors.gray30),
          borderRadius: BorderRadius.circular(4)),
      child: Column(
        children: [
          Container(
            color: AppColors.gray10,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildText(
                            name: 'Franklin Templeton Moderate Model Portfolio - Class II ',
                            fontColor: AppColors.coolBlack,
                            fontSize: 16),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            buildText(name: 'Fund No. ', fontColor: AppColors.gray80),
                            buildText(name: '#229', fontColor: AppColors.coolBlack)
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    children: [
                      buildText(name: 'Fund Risk', fontColor: AppColors.gray80),
                      const SizedBox(height: 5),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: fundRiskColor ?? AppColors.lightGreen),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12, right: 12, top: 5, bottom: 5),
                            child: Center(
                                child: buildText(
                                    name: fundRiskPriority,
                                    fontColor: AppColors.darkPalm,
                                    fontWeight: FontWeight.w500)),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
          if (isInvestments)
            for (int i = 0; i < 3; i++)
              Column(
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.only(right: 16.0, left: 16, top: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildText(name: 'Label', fontColor: AppColors.gray80),
                        buildText(
                            name: 'Lorem ipsum sit',
                            fontColor: AppColors.coolBlack,
                            fontWeight: FontWeight.w400,
                            fontSize: 16)
                      ],
                    ),
                  ),
                  const Divider(),
                ],
              ),
          if (!isInvestments) ...[
            Padding(
              padding: const EdgeInsets.only(right: 16.0, left: 16, top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildText(name: 'Current %', fontColor: AppColors.gray80),
                  buildText(
                      name: '100%',
                      fontColor: AppColors.coolBlack,
                      fontWeight: FontWeight.w700,
                      fontSize: 16)
                ],
              ),
            ),
            const Divider(),
          ],
          Padding(
            padding: const EdgeInsets.only(
                right: 16.0, left: 16, top: 8, bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    buildText(
                        name: 'Update Investor Profile',
                        fontColor: AppColors.primaryBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2.0),
                      child: Image.asset('assets/arrow.png',
                          color: AppColors.primaryBlue, height: 20, width: 20),
                    ),
                  ],
                ),
                Row(
                  children: [
                    buildText(
                        name: 'Transfer',
                        fontColor: AppColors.primaryBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2.0),
                      child: Image.asset('assets/arrow.png',
                          color: AppColors.primaryBlue, height: 20, width: 20),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

buildButton({String buttonName = ''}) {
  return Padding(
    padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
    child: Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.primaryBlue, borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildText(
              name: buttonName,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontColor: AppColors.white),
          Padding(
            padding: const EdgeInsets.only(bottom: 2.0),
            child: Image.asset('assets/arrow.png',
                color: AppColors.white, height: 20, width: 20),
          ),
        ],
      ),
    ),
  );
}

buildContactText() {
  return Column(
    children: [
      Padding(
          padding: const EdgeInsets.all(16.0),
          child: buildText(
              name: 'Generally there is a maximum of three verbal and/or electronic trades allowed in a rolling 60 day timeframe before being resurfaced to requests via regular or overnight mail for one year.',
              fontSize: 12,
              fontColor: AppColors.gray90,
              fontWeight: FontWeight.w400)),
      Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 56),
        child: Text.rich(TextSpan(
            style: TextStyle(
                fontFamily: 'Effra',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.gray90),
            children: [
          const TextSpan(text: 'Please see your prospectus, contact your registered representative, or call '),
          TextSpan(
              text: '1-800-598-2019 ',
              style: TextStyle(
                  fontFamily: 'Effra',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primaryBlue)),
          const TextSpan(text: 'for details. To access investments division daily unit values, performance summaries, and to download a prospectus please '),
          TextSpan(
              text: 'click here',
              style: TextStyle(
                  fontFamily: 'Effra',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primaryBlue)),
        ])),
      )
    ],
  );
}
