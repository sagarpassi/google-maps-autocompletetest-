import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/directions.dart';
import 'package:google_maps_webservice/distance.dart';
import 'package:google_maps_webservice/geocoding.dart';
import 'package:google_maps_webservice/geolocation.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_maps_webservice/timezone.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geocoder/geocoder.dart';

import 'Constant.dart';
import 'Moreinfo.dart';

const bottomContainerHeight = 80.0;
const bottomContainerColour = Color.fromRGBO(41, 171, 226, 1);
const activeCardColour = Colors.blue;
const inactiveCardColour = Colors.blueGrey;
const kGoogleApiKey = "AIzaSyD6eArYHrsL87NVI5PipWXgIY0xMhuV3YI";
GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

class finalpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loco'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      TextField(
                        onTap: () async {
                          final Prediction p = await PlacesAutocomplete.show(
                              context: context, apiKey: kGoogleApiKey);

                          displayPrediction(p);
                        },
                        decoration:
                            kTextFieldDecoration.copyWith(hintText: 'Address'),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextField(
                          onChanged: (value) {},
                          decoration:
                              kTextFieldDecoration.copyWith(hintText: 'DOB'),
                          keyboardType: TextInputType.number),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextField(
                          onChanged: (value) {},
                          decoration: kTextFieldDecoration.copyWith(
                              hintText: 'Reference'),
                          keyboardType: TextInputType.number),
                      SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddMore()));
              },
              child: Container(
                child: Center(
                  child: Text(
                    'SUBMIT',
                    style: Klargebutton,
                  ),
                ),
                color: bottomContainerColour,
                margin: EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.only(bottom: 20.0),
                width: double.infinity,
                height: bottomContainerHeight,
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future<Null> displayPrediction(Prediction p) async {
  if (p != null) {
    final PlacesDetailsResponse detail =
        await _places.getDetailsByPlaceId(p.placeId);

    var placeId = p.placeId;
    double lat = detail.result.geometry.location.lat;
    double lng = detail.result.geometry.location.lng;

    var address = await Geocoder.local.findAddressesFromQuery(p.description);
    String name = detail.result.formattedAddress;

    print(lat);
    print(lng);
    print(name);
  }
}
