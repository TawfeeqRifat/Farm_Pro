import 'dart:collection';
import 'package:farm_pro/Utilities/CustomWidgets.dart';
import 'package:farm_pro/Utilities/custom.dart';
import 'package:farm_pro/sample_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:farm_pro/pages/details_card.dart';
import 'package:google_fonts/google_fonts.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key,required this.detail});
  final dynamic detail;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final searchController = TextEditingController();

  String query='';
  List<String> searchResults=details.keys.toList();
  void onQueryChanged(String query){
    setState(() {
      if(query==''){
        searchResults= widget.detail.keys.toList();
      }
      else{
        searchResults.clear();
        for (var i in widget.detail.keys) {
          if (i.toLowerCase().contains(query.toLowerCase())) {
            searchResults.add(i);
          }
        }
      }

      debugPrint(query);
      for(var i in searchResults){
        debugPrint(i);
      }

    });
  }

  void textClearance(){
    setState(() {


    });
  }
  Widget displayeHomePageCards(){

    return Column(
      children:[
        for(var i in searchResults)
            HomePageCard(detail: widget.detail['$i']),

      ]
    );
  }



  void dispose(){
    searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          VerticalPadding(paddingSize: 60),

          Padding(padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              onChanged: onQueryChanged,
              controller: searchController,
              style: GoogleFonts.signikaNegative(
                textStyle: MyTextTheme.displaySmall,
              ),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white54,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(//color: Colors.white
                  ),
                ),
                hintText: 'Farmer name',
                prefixIcon: Icon(Icons.search, color: Colors.white,),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      searchController.text='';
                      searchResults= widget.detail.keys.toList();
                      FocusScope.of(context).unfocus();
                    });

                  },
                  icon: Icon(Icons.clear,color: Colors.white,),
                ),

              ),
              textAlign: TextAlign.left,
            ),),
          VerticalPadding(paddingSize: 11),
          Container(

            height: 663,
            child: SingleChildScrollView(
                child: Container(
                  width: 500,
                  color: darkTeal,
                  child: Column(
                    children: [
                      displayeHomePageCards(),
                    ],
                  ),

                )
            ),
          ),
        ],
      ),

    );

  }

}

class HomePageCard extends StatefulWidget {
  const HomePageCard({super.key, required this.detail});
  final dynamic detail;
  @override
  State<HomePageCard> createState() => _HomePageCardState();
}

class _HomePageCardState extends State<HomePageCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(onPressed: (){

          Navigator.push(context, CupertinoPageRoute(
              fullscreenDialog: true  ,
              builder: (context)=> detailsCard(details: widget.detail)));
        },

            child: Container(
              decoration: BoxDecoration(
                color: lightTeal,
                borderRadius: BorderRadius.circular(5),
              ),
              width: 380,
              child: Column(
                children: [
                  const VerticalPadding(paddingSize: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const HorizontalPadding(paddingSize: 5),
                      SizedBox(
                        height: 130,
                        width: 130,
                        child: ClipRRect(
                          child: Image.network(widget.detail['profile'],
                              fit: BoxFit.cover),
                        ),
                      ),
                      const HorizontalPadding(paddingSize: 10),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(widget.detail['name'],style: GoogleFonts.signikaNegative(
                            textStyle: TextStyle(
                              color: myWhite,
                              fontWeight: FontWeight.w600,
                              fontSize: 22,
                            ),
                          )),
                          const VerticalPadding(paddingSize: 5),
                          SizedBox(
                            height: 40,
                            width: 195,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children:[
                                  for(var i in widget.detail['farm_type'])
                                    FarmTypeFloartVer2(typeName: i),
                                ],
                              ),),
                          )
                        ],
                      ),

                    ],
                  ),

                  const VerticalPadding(paddingSize: 5),
                ],
              ),

            )
        ),
        VerticalPadding(paddingSize: 10),
      ],
    );
  }
}
