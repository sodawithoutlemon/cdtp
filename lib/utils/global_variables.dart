import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

double screenwidth = 0;
double screenheight = 0;
double safespaceheight = 0;
double safespaceheightbottom = 0;

Color firstlyBlack = Colors.black;
Color firstlyWhite = Colors.white;

late FirebaseFirestore firestoreGlobal;