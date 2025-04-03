// ignore_for_file: avoid_print
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:dio_api_client/dio_api_client.dart';

void main()=>runApp(MaterialApp(
  home: NinjaCard(),
));

class NinjaCard extends StatefulWidget {
  const NinjaCard({super.key});

  @override
  State<NinjaCard> createState() => _NinjaCardState();
}



class _NinjaCardState extends State<NinjaCard> {

  // ignore: prefer_typing_uninitialized_variables
  var jsonList;

  @override
  void initState() {
    super.initState();
    getData();
  }

 void getData() async {
  try {
    Response response = await Dio().get('https://jsonplaceholder.typicode.com/todos/1');
    print(response.data);

    setState(() {
      jsonList = response.data;
    });

  } catch (e) {
    print('catched error -> $e');
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 63, 69, 71),
      appBar: AppBar(
        title:Text('To-Do List',
        style:TextStyle(
          color:Colors.amber[400],
           fontWeight: FontWeight.bold,
        ),
        ),
        centerTitle: true,
        backgroundColor:const Color.fromARGB(255, 37, 37, 37),
        elevation: 0.0,
        
      ),
      body: jsonList==null?Center(
        child:SpinKitPouringHourGlass(
        color: Colors.amber,
        size: 50.0,
),
        )
      : Padding(
        padding: EdgeInsets.fromLTRB(30.0,40.0,30.0,0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:<Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/logo4x.jpg'),
                radius: 101.0,
                
              ),
            ),
            Divider(
              height: 90.0,
              color:Colors.grey[600],
            ),
            Text(
              'id',
              style:TextStyle(
                color: Colors.grey,
                 fontSize: 30.0,
                letterSpacing: 2.0,
              fontWeight: FontWeight.bold,
              )
            ),
            SizedBox(height:10.0),
            Row(
              children:<Widget>[
                 Icon(
                  Icons.arrow_right_alt,
                  color: Colors.white38,
                  size:30.0,
                ),
                Text(
                  '${jsonList['id']}',
                  style:TextStyle(
                    color: Colors.amberAccent[200],
                    letterSpacing: 2.0,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  )
                ),
              ],
            ),
            SizedBox(height:30.0),
            Text(
              'title',
              style:TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
                 fontSize: 30.0,
                fontWeight: FontWeight.bold,
              )
            ),
            SizedBox(height:10.0),
            
            Row(
              children:<Widget>[
                 Icon(
                  Icons.arrow_right_alt,
                  color: Colors.white54,
                  size:40.0,
                ),
                Text(
                  '${jsonList['title']}',
                  style:TextStyle(
                    color: Colors.amberAccent[200],
                    letterSpacing: 2.0,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  )
                ),
              ],
            ),
             SizedBox(height:30.0),
             Text(
              'Completed',
              style:TextStyle(
                color: Colors.grey,
                fontSize: 30.0,
                letterSpacing: 2.0,
                fontWeight: FontWeight.bold,
              )
            ),
            SizedBox(height: 10.0),
             Row(
              children:<Widget>[
                Icon(
                  Icons.arrow_right_alt,
                  color: Colors.white60,
                  size:60.0,
                ),
                SizedBox(width: 10.0,),
                Text(
                  '${jsonList['completed']}',
                  style:TextStyle(
                    color:Colors.grey[400],
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
             ),
          ]
        ),
        )
    );
  }
}
