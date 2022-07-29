// @dart=2.9

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:orhaneli_wep/modeller/haberModel.dart';

import 'package:orhaneli_wep/servisler/firestoreServisi.dart';

import 'servisler/firebase_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseConfig.platformOptions);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key key, this.haber}) : super(key: key);
  final Haber haber;
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ORHANELİ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: _initialization,
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            print('hata');
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return MyHomePage(
              title: 'Orhaneli Wep',
            );
          }
          return LinearProgressIndicator();
        }),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title, this.haber}) : super(key: key);

  final String title;
  final Haber haber;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orhaneli web'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Şirin İlçemiz Orhaneli Hakkında Herşey',
                  style: TextStyle(color: Colors.blue, fontSize: 25),
                ),
              ),
              Image.asset(
                'assets/images/karagöz.jpg',
                height: 200,
              ),
              SizedBox(
                height: 25,
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                    stream: FirestoreSerisi().haberleriGetir(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return LinearProgressIndicator();
                      }
                      return ListView.builder(
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (context, index) {
                            Haber haber =
                                Haber.dokumandanUret(snapshot.data.docs[index]);
                            print(haber.aciklama);
                           // return _haberlerSayfasi(haber);
                          });
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_haberlerSayfasi(Haber haber) {
  Text('açıklma');
}
