import 'package:flutter/material.dart';

void main(){
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Interest Calculator',
        home: SIForm(),
        theme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.indigo,
            accentColor: Colors.indigoAccent
        ),
      )
  );
}
//create Statefulwidget
class SIForm extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SIFormState();
  }

}

//Create a State Class
class _SIFormState extends State<SIForm>{
  //define some property
  var _currencies = ['Taka','Dollars','Pounds'];
  final _minimumPadding = 5.0;
  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = Theme.of(context).textTheme.headline6;

    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Interest Calculator'),
      ),



      body: Container(
        margin: EdgeInsets.all(_minimumPadding*2),
        child: ListView(
          children: <Widget>[
            //Calling the Imageasset
            getImageAsset(),
            //this is a Textfield Bar
            Padding(
                padding: EdgeInsets.only(top: _minimumPadding, bottom: _minimumPadding),
                child: TextField(
                  keyboardType: TextInputType.number,
                  style: textStyle,
                  //Design the TextField
                  decoration: InputDecoration(
                      labelText: 'Principal',
                      hintText: 'Enter a principal e.g 12000',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),

                      )
                  ),
                )),



            Padding(
                padding: EdgeInsets.only(top: _minimumPadding,bottom: _minimumPadding),
                child: TextField(
                  keyboardType: TextInputType.number,
                  style: textStyle,
                  //Design the TextField
                  decoration: InputDecoration(
                      labelText: 'Rate of Interest',
                      hintText: 'In percent',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),

                      )
                  ),
                )),



            //for Row
            Padding (
                padding: EdgeInsets.only(top:_minimumPadding , bottom:_minimumPadding ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child:
                        TextField(
                          keyboardType: TextInputType.number,
                          style: textStyle,
                          //Design the TextField
                          decoration: InputDecoration(
                              labelText: 'Term',
                              hintText: 'Time in Years',
                              labelStyle: textStyle,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),

                              )
                          ),
                        )),

                    Container(width:_minimumPadding * 5 ,),


                    //DropDown start

                    Expanded(
                        child: DropdownButton<String>(
                          items: _currencies.map((String value) {
                            return DropdownMenuItem<String>(
                              value:value,
                              child: Text(value),
                            );
                          }).toList(),

                          value: 'Taka',

                          onChanged: (String newValueSelected){
                            //code to execute , when a menu item is selected from drop down appear by the user

                          },

                        ))

                  ],

                )),


            //Raised Button
            Padding(
                padding: EdgeInsets.only(bottom: _minimumPadding,top: _minimumPadding),
                child: Row(children: <Widget>[

                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).accentColor,
                      textColor: Theme.of(context).primaryColorDark,
                      child: Text('Calculate',textScaleFactor: 1.5,),
                      onPressed: (){

                      },
                    ),
                  ),


                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text('Reset',textScaleFactor: 1.5,),
                      onPressed: (){

                      },
                    ),
                  ),


                ],)),

            // add a textview
            Padding(
              padding: EdgeInsets.all(_minimumPadding * 2),
              child: Text('Todo Text'),
            )



          ],
        ),
      ) ,
    );
  }
  //create a function for Image
  Widget getImageAsset(){

    AssetImage assetImage = AssetImage('images/interest.png');
    Image image = Image(image: assetImage,width: 125.0,height: 125.0,);
    return Container(child: image,margin: EdgeInsets.all(_minimumPadding * 10),);
  }

}