// @dart=2.9
// ignore: depend_on_referenced_packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:orhaneli_wep/modeller/kullanici.dart';

class FirestoreSerisi {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final DateTime zaman = DateTime.now();

  Future<void> kullaniciOlustur({
    id,
    email,
    kullaniciAdi,
    fotoUrl = '',
  }) async {
    await _firestore.collection('kullanicilar').doc(id).set({
      'kullaniciAdi': kullaniciAdi,
      'email': email,
      'fotoUrl': fotoUrl,
      'hakkinda': '',
      'olusturulmaZamani': zaman,
    });
  }

  Future<Kullanici> kullaniciGetir(id) async {
    DocumentSnapshot doc =
        await _firestore.collection('kullanicilar').doc(id).get();
    if (doc.exists) {
      Kullanici kullanici = Kullanici.dokumandanUret(doc);
      return kullanici;
    }
    return null;
  }

  Stream<QuerySnapshot> haberleriGetir() {
   return _firestore
        .collection('haberler')
        .orderBy('zaman', descending: true)
        .snapshots();
  
  }
}
