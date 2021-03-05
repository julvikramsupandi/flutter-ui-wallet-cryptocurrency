import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:wallet_cryptocurrency/ui/component.dart';

class DetailWalletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: SafeArea(
          child: appBar(
              left: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back_ios, color: Colors.black54)),
              title: 'Bitcoin Wallet',
              right: Icon(Icons.more_vert, color: Colors.black54)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            _cardWallet(
              iconUrl:
                  'https://icons.iconarchive.com/icons/cjdowner/cryptocurrency/128/Bitcoin-icon.png',
              crypto: 'Bitcoin',
              cryptoShort: 'BTC',
              totalCrypto: '3.519020 BTC',
              total: '\$19.153 USD',
              precent: -2.33,
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Day'),
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                      decoration: BoxDecoration(
                          color: Colors.blueGrey[200],
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Text(
                        'Week',
                        style: TextStyle(color: Colors.white),
                      )),
                  Text('Month'),
                  Text('Year'),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            card(
              padding: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            _dot(color: Colors.pink),
                            Text(
                              'Lower: \$4.896',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            _dot(color: Colors.green),
                            Text(
                              'Higher:\$6.857',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 5,
                    child: Stack(children: [
                      LineChart(
                        sampleData(),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 20,
                        child: Row(
                          children: [
                            _dot(size: 18, color: Colors.orangeAccent),
                            Text(
                              '1BTC=\$5.483',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: _actionButton(
                    text: 'Buy',
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: _actionButton(
                    text: 'Sell',
                    color: Colors.pink,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  LineChartData sampleData() {
    return LineChartData(
      lineTouchData: LineTouchData(
        enabled: false,
      ),
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: false,
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      // minX: 0,
      maxX: 12,
      maxY: 4,
      minY: 0,
      lineBarsData: linesBarData(),
    );
  }

  List<LineChartBarData> linesBarData() {
    return [
      LineChartBarData(
        spots: [
          FlSpot(1, 2),
          FlSpot(3, 2.8),
          FlSpot(7, 2.2),
          FlSpot(10, 2.8),
          FlSpot(12, 2.6),
          FlSpot(13, 3),
        ],
        isCurved: true,
        colors: const [
          Colors.orangeAccent,
        ],
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(show: true, colors: [
          Colors.orange[100],
        ]),
      ),
    ];
  }

  Widget _dot({double size = 10, Color color = Colors.black}) {
    return Container(
      margin: EdgeInsets.all(10),
      width: size,
      height: size,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20)),
        child: Container(
          color: color,
        ),
      ),
    );
  }

  Widget _cardWallet(
      {String crypto,
      cryptoShort,
      iconUrl,
      total,
      totalCrypto,
      double precent}) {
    return card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                '$iconUrl',
                width: 50,
              ),
              SizedBox(width: 20),
              Expanded(
                child: Text('$crypto',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Text('$cryptoShort')
            ],
          ),
          SizedBox(height: 20),
          Text(
            '$totalCrypto',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.black87),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$total',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black38),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                decoration: BoxDecoration(
                    color: precent >= 0 ? Colors.green : Colors.pink,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Text(
                  precent >= 0 ? '+ $precent %' : '$precent %',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
          Center(
            child: Icon(Icons.keyboard_arrow_down,
                size: 30, color: Colors.black45),
          )
        ],
      ),
    );
  }

  Widget _actionButton({Color color, String text}) {
    return card(
        child: Column(
      children: [
        ClipOval(
          child: Material(
            color: color,
            child: InkWell(
              splashColor: Colors.red, // inkwell color
              child: SizedBox(
                  width: 56,
                  height: 56,
                  child: Icon(
                    Icons.attach_money,
                    color: Colors.white,
                    size: 25.0,
                  )),
              onTap: () {},
            ),
          ),
        ),
        SizedBox(height: 10),
        Text('$text', style: TextStyle(fontSize: 24, color: Colors.black54))
      ],
    ));
  }
}
