// @dart=2.9
// ignore_for_file: depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';

class Haber {
  final String id;
  final String haberResimUrl;
  final String aciklama;
  final int begeniSayisi;
  final Timestamp zaman;
  final String baslik;

  Haber(
      {this.id,
      this.haberResimUrl,
      this.aciklama,
      this.begeniSayisi,
      this.baslik,
      this.zaman});

  factory Haber.dokumandanUret(DocumentSnapshot doc) {
    var docData = doc.data();
    return Haber(
        id: doc.id,
        haberResimUrl: doc['haberResmiUrl'],
        aciklama: doc['aciklama'],
        begeniSayisi: doc['begeniSayisi'],
        baslik: doc['baslik'],
        zaman: doc['zaman']);
  }
}
