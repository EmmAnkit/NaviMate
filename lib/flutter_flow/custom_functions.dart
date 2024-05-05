import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/supabase/supabase.dart';
import '/auth/firebase_auth/auth_util.dart';

DateTime? timeChangerFunction(DateTime? appointmentTime) {
  // get appointmentTime and return 1 hour and half less time back
  if (appointmentTime != null) {
    return appointmentTime.subtract(Duration(hours: 1, minutes: 30));
  }
  return null;
}
