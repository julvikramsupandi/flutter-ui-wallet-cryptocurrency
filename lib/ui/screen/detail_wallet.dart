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
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text("Chart Comming Soon", style: TextStyle(fontSize: 20)),
                  SizedBox(
                    height: 50,
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
