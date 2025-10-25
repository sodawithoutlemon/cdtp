import 'package:cdtp/utils/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../utils/global_variables.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool nightmode = false;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: loading,
        child: Container(
          height: screenheight,
          padding: EdgeInsets.only(top: safespaceheight, bottom: safespaceheightbottom),
          width: screenwidth,
          child: Column(
            children: [
              Container(
                height: screenheight / 10,
                width: screenwidth,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: screenwidth / 20),
                      child: Text(
                        "Hoşgeldiniz.",
                        style: TextStyle(color: firstlyBlack, fontSize: screenheight / 30),
                      ),
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.only(right: screenwidth / 20),
                      child: CupertinoSwitch(
                        value: nightmode,
                        onChanged: (x) {
                          setState(() {
                            nightmode = x;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              pageButton(
                bc: Color(0xffc4a7ff),
                tc: firstlyBlack,
                margin: EdgeInsets.only(bottom: screenheight / 40),
                func: () {
                  firestoreGlobal.collection("bilgiler").doc("testHasta").get().then((event){
                    var data = event.data();
                    String hastaismi = data?["isim"];
                    print(hastaismi);
                  });
                },
                text: "Veri Al",
                c: firstlyWhite,
                width: screenwidth * 9 / 10,
                height: screenheight / 3,
              ),
              pageButton(
                bc: Color(0xffadc8ff),
                tc: firstlyBlack,
                margin: EdgeInsets.only(bottom: screenheight / 20),
                func: () {
                  firestoreGlobal.collection("bilgiler").doc("testHasta").get().then((event){
                    event.reference.update({"isim": "mahmut"});
                  });
                },
                text: "Veri Ver",
                c: firstlyWhite,
                width: screenwidth * 9 / 10,
                height: screenheight / 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
