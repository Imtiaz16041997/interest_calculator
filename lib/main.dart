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

  var _currentItemSelected = '';

  @override
  void initState(){
    super.initState();
    _currentItemSelected = _currencies[0];
  }

  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();

  var displayResult = '';

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
                  controller: principalController,
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
                  controller: roiController,
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
                          controller: termController,
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

                          value: _currentItemSelected,

                          onChanged: (String newValueSelected){
                            //code to execute , when a menu item is selected from drop down appear by the user
                            _onDropDownItemSelected(newValueSelected);

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

                        setState(() {
                          this.displayResult = _calculateTotalReturns();
                        });

                      },
                    ),
                  ),


                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text('Reset',textScaleFactor: 1.5,),
                      onPressed: (){
                        setState(() {
                          _reset();
                        });
                      },
                    ),
                  ),


                ],)),

            // add a textview
            Padding(
              padding: EdgeInsets.all(_minimumPadding * 2),
              child: Text(displayResult, style:  textStyle,),
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

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentItemSelected =  newValueSelected;
    });
  }

  String _calculateTotalReturns() {

    double principle = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);

    double totalAmountPayable = principle + (principle * roi * term) / 100;

    String result = 'After $term years, your investment will be worth $totalAmountPayable $_currentItemSelected';

    return result;
  }

  void _reset() {

    principalController.text = '';
    roiController.text = '';
    termController.text = '';
    displayResult = '' ;
    _currentItemSelected = _currencies[0];
  }


}