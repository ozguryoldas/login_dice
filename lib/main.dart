import 'package:flutter/material.dart';
import 'dice.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice game',
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: (){}
        ),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: (){}
          )
        ],
      ),
      body: Builder(
          builder:(context) {
            return GestureDetector(
              onTap: (){
                FocusScope.of(context).unfocus();
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 50)),
                    const Center(
                        child: Image(
                          image: AssetImage('image/chef.gif'),
                          width: 170.0,
                          height: 190.0,
                        )
                    ),
                    Form(
                        child: Theme(
                            data: ThemeData(
                                primaryColor: Colors.teal,
                                inputDecorationTheme: const InputDecorationTheme(
                                    labelStyle: TextStyle(
                                        color: Colors.teal,
                                        fontSize: 15.0
                                    )
                                )
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(40.0),
                              child: Column(
                                children: [
                                  TextField(
                                    controller: controller,
                                    decoration: const InputDecoration(
                                        labelText: 'Enter "dice"'
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                  TextField(
                                    controller: controller2,
                                    decoration: const InputDecoration(
                                        labelText: 'Enter Password'
                                    ),
                                    keyboardType: TextInputType.text,
                                    obscureText: true,
                                  ),
                                  const SizedBox(height: 40.0,),
                                  ButtonTheme(
                                    minWidth: 100.0,
                                    height: 50.0,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.orangeAccent,
                                      ),
                                      child: const Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                        size: 35.0,
                                      ),
                                      onPressed: (){
                                        if(controller.text == 'dice' && controller2.text == '1234'){
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (BuildContext context) => const Dice()));
                                        } else if(controller.text != 'dice' && controller2.text == '1234'){
                                          showSnackBar3(context);
                                        } else if(controller.text == 'dice' && controller2.text != '1234'){
                                          showSnackBar2(context);
                                        }
                                        else {
                                          showSnackBar(context);
                                        }
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ))
                    )
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}

void showSnackBar(BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content:
      Text('kullanıcı adı veya şifre hatalı',
        textAlign: TextAlign.center,),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blue,
      )
  );
}

void showSnackBar2(BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content:
      Text('şifre hatalı ',
        textAlign: TextAlign.center,),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blue,
      )
  );
}

void showSnackBar3(BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(content:
      Text('kullanıcı adı hatalı',
        textAlign: TextAlign.center,),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blue,
      )
  );
}