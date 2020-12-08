import 'package:flutter/material.dart';
import 'page_home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travelalala',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PageLogin(),
    );
  }
}

class PageLogin extends StatefulWidget {
  @override
  _PageLoginState createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  final myUsernameController = TextEditingController();

  final myPasswordController = TextEditingController();

  final myEmailController = TextEditingController();

  String nUsername, nPassword, nEmail;

  final _formKey = GlobalKey<FormState>();

  final logo = Hero(
    tag: 'hero',
    child: CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 48.0,
      child: Image.asset('assets/logoo.png'),
    ),
  );

  Widget nameField() {
    return TextFormField(
      validator: (value) {
        if (value.isEmpty) {
          return 'Please Input Username';
        } else if (nUsername != 'yoga') {
          return 'Username Salah';
        }
        return null;
      },
      controller: myUsernameController,
      decoration: InputDecoration(
        labelText: 'Nama Lengkap',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      validator: (value) {
        if (value.isEmpty) {
          return 'Please Input Email';
        } else if (!value.contains('@')) {
          return 'Email tidak valid';
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      controller: myEmailController,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'email@example.com',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
  }

  Widget passwordField() {
    return TextFormField(
      validator: (value) {
        if (value.isEmpty) {
          return 'Please Input Password';
        } else if (nPassword.length <= 5) {
          return 'password harus lebih dari 5 karakter';
        }
        return null;
      },
      maxLength: 16,
      maxLengthEnforced: true,
      controller: myPasswordController,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Login'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            nameField(),
            SizedBox(height: 24.0),
            emailField(),
            SizedBox(height: 24.0),
            passwordField(),
            SizedBox(height: 24.0),
            RaisedButton(
              color: Colors.blueAccent,
              textColor: Colors.white,
              onPressed: () {
                nUsername = myUsernameController.text;
                nPassword = myPasswordController.text;
                nEmail = myEmailController.text;

                if (_formKey.currentState.validate()) {
                  if (nUsername != 'yoga') {
                    print("username salah");
                  } else if (nPassword.length <= 5) {
                    print("password harus lebih dari 5 karakter !");
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PageHome(
                                  nama: nUsername,
                                  password: nPassword,
                                  email: nEmail,
                                )));
                  }
                }
              },
              child: Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
