import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dynamic_theme/dynamic_theme.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<charts.Series<CasesCov, String>> _seriesData;
  List<charts.Series<Updates, String>> _seriesPieData;
  List<charts.Series<CasesCovid, int>> _seriesLineData;

  _generateData() {
    var data1 = [
      new CasesCov( 3695025,'USA','TotalCases'),
      new CasesCov(2014738, 'Brazil', 'TotalCases'),
      new CasesCov(1005760, 'India', 'TotalCases'),
      new CasesCov(752797,'Russia', 'TotalCases'),
      new CasesCov(341586, 'Peru','TotalCases')
    ];
    var data2 = [
      new CasesCov(141118, 'USA', 'TotalDeaths'),
      new CasesCov(76822, 'Brazil', 'TotalDeaths'),
      new CasesCov(25619, 'India', 'TotalDeaths'),
      new CasesCov(11937, 'Russia', 'TotalDeaths'),
      new CasesCov(12615, 'Peru', 'TotalDeaths')

    ];
    var data3 = [
      new CasesCov(1679633, 'USA', 'TotalRecovered'),
      new CasesCov(1366775, 'Brazil', 'TotalRecovered'),
      new CasesCov(577327, 'India', 'TotalRecovered'),
      new CasesCov(531692, 'Russia', 'TotalRecovered'),
      new CasesCov(230994, 'Peru', 'TotalRecovered')
    ];



    var piedata = [
      new Updates('Cases', 13961697, Color(0xff3366cc)),

      new Updates('Recovered', 8294175, Color(0xff109618)),
      new Updates('active', 5074506, Color(0xfffdbe19)),
      new Updates('critical', 59898, Color(0xffff9900)),
      new Updates('Deaths',593016, Color(0xffdc3912)),
    ];

    var linesalesdata = [
      new CasesCovid(1 ,3695025),
      new CasesCovid(2,2014738),
      new CasesCovid(3, 1005760),
      new  CasesCovid(4,752797),
      new  CasesCovid(5, 341586)



    ];
    var linesalesdata1=[
      new CasesCovid(1 ,141118),
      new CasesCovid(2,76822),
      new CasesCovid(3,25619 ),
      new CasesCovid(3,11937 ),
      new CasesCovid(3,12615 )


    ];
    var linesalesdata2=[
      new CasesCovid(1 ,1679633),
      new CasesCovid(2,1366775),
      new CasesCovid(3,636660 ),
      new CasesCovid(3,531692 ),
      new CasesCovid(3,230994 )

    ];




    _seriesData.add(
      charts.Series(
        domainFn: (CasesCov cases, _) => cases.place,
        measureFn: (CasesCov cases, _) => cases.casescov,
        id: 'TotalCases',
        data: data1,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (CasesCov cases, _) =>
            charts.ColorUtil.fromDartColor(Color(0xff3366cc)),
      ),
    );

    _seriesData.add(
      charts.Series(
        domainFn: (CasesCov cases, _) => cases.place,
        measureFn: (CasesCov cases, _) => cases.casescov,
        id: 'TotalRecovered',
        data: data2,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (CasesCov cases, _) =>
            charts.ColorUtil.fromDartColor(Color(0xff109618)),
      ),
    );

    _seriesData.add(
      charts.Series(
        domainFn: (CasesCov cases, _) => cases.place,
        measureFn: (CasesCov cases, _) => cases.casescov,
        id: 'TotalDeaths',
        data: data3,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (CasesCov cases, _) =>
            charts.ColorUtil.fromDartColor(Color(0xffdc3912)),
      ),
    );

    _seriesPieData.add(
      charts.Series(
        domainFn: (Updates task, _) => task.task,
        measureFn: (Updates task, _) => task.taskvalue,
        colorFn: (Updates task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'COVIDUPDATES',
        data: piedata,
        labelAccessorFn: (Updates row, _) => '${row.taskvalue}',
      ),
    );

    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff3366cc)),
        id: 'COUNTRY STATS (CASES)',
        data: linesalesdata,
        domainFn: (CasesCovid stats, _) =>stats.parameter,
        measureFn: (CasesCovid stats, _) => stats.casesCovid,
      ),

    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xffdc3912)),
        id: 'COUNTRY STATS (Deaths)',
        data: linesalesdata1,
        domainFn: (CasesCovid stats, _) => stats.parameter,
        measureFn: (CasesCovid stats, _) => stats.casesCovid,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff109618)),
        id: 'COUNTRY STATS (Recovered)',
        data: linesalesdata2,
        domainFn: (CasesCovid stats, _) => stats.parameter,
        measureFn: (CasesCovid stats, _) => stats.casesCovid,
      ),
    );


  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _seriesData = List<charts.Series<CasesCov, String>>();
    _seriesPieData = List<charts.Series<Updates, String>>();
    _seriesLineData = List<charts.Series<CasesCovid, int>>();
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(



            backgroundColor: Colors.black87,
            //backgroundColor: Color(0xff308e1c),
            bottom: TabBar(
              indicatorColor: Color(0xff9962D0),
              tabs: [
                Tab(
                  icon: Icon(FontAwesomeIcons.solidChartBar),
                ),
                Tab(icon: Icon(FontAwesomeIcons.chartPie)),
                Tab(icon: Icon(FontAwesomeIcons.chartLine)),
              ],
            ),
            title: Text('COVID Charts',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
          ),
          body: TabBarView(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Covid Updates',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
                        Expanded(
                          child: charts.BarChart(
                            _seriesData,
                            animate: true,
                            behaviors: [

                            new charts.DatumLegend(
                              outsideJustification: charts.OutsideJustification.endDrawArea,
                            )
                            ],
                            //behaviors: [new charts.SeriesLegend()],
                            animationDuration: Duration(seconds: 3),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Cases Statistics',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10.0,),
                        Expanded(
                          child: charts.PieChart(
                              _seriesPieData,
                              animate: true,
                              animationDuration: Duration(seconds: 3),
                              behaviors: [
                                new charts.DatumLegend(
                                  outsideJustification: charts.OutsideJustification.endDrawArea,
                                  horizontalFirst: false,
                                  desiredMaxRows: 2,
                                  cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
                                  entryTextStyle: charts.TextStyleSpec(
                                      color: charts.MaterialPalette.purple.shadeDefault,
                                      fontFamily: 'Georgia',
                                      fontSize: 11),
                                )
                              ],
                              defaultRenderer: new charts.ArcRendererConfig(
                                  arcWidth: 100,
                                  arcRendererDecorators: [
                                    new charts.ArcLabelDecorator(
                                        labelPosition: charts.ArcLabelPosition.inside)
                                  ])),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Covid Stats',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
                        Expanded(
                          child: charts.LineChart(
                              _seriesLineData,
                              defaultRenderer: new charts.LineRendererConfig(
                                  includeArea: true, stacked: true),
                              animate: true,
                              animationDuration: Duration(seconds:3),
                              behaviors: [
                                new charts.ChartTitle('Parameter(',
                                    behaviorPosition: charts.BehaviorPosition.bottom,
                                    titleOutsideJustification:charts.OutsideJustification.middleDrawArea),
                                new charts.ChartTitle('COUNTRYSTATS',
                                    behaviorPosition: charts.BehaviorPosition.start,
                                    titleOutsideJustification: charts.OutsideJustification.middleDrawArea),
                                new charts.ChartTitle('Update',
                                  behaviorPosition: charts.BehaviorPosition.end,
                                  titleOutsideJustification:charts.OutsideJustification.middleDrawArea,
                                )
                              ]
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CasesCov {
  String place;
  double casescov;
  String update;


  CasesCov(this.casescov, this.place,this.update);
}

class Updates {
  String task;
  double taskvalue;
  Color colorval;

  Updates(this.task, this.taskvalue, this.colorval);
}

class CasesCovid {
  int parameter;
  double casesCovid;

  CasesCovid(this.parameter, this.casesCovid);
}

