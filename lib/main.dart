import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outdoorsyclone/Model/RV.dart';
import 'package:outdoorsyclone/Model/RVData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OutDoorsyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class OutDoorsyHomePage extends StatelessWidget {
  const OutDoorsyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RVListing(),
    );
  }
}

class RVListing extends StatelessWidget {
  const RVListing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: ListingNearOlympicPark(),
      ),
    );
  }
}

class ListingNearOlympicPark extends StatelessWidget {
  const ListingNearOlympicPark({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: rvData.map((e) {
          return GestureDetector(
            onTap: () => showModalBottomSheet<dynamic>(
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return Container(
                  child: modalBottomSheetContent(context, e),
                  height: MediaQuery.of(context).size.height * 0.90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                );
              },
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width - 20,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            e.rvPhotoURL,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Positioned(
                          left: 10,
                          bottom: 10,
                          child: Container(
                            width: 120,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.cyan.shade500),
                            child: Center(
                              child: Text(
                                e.rvTags.first.rvTag.toUpperCase(),
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 10,
                          bottom: 10,
                          child: Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    e.rvDisplayName,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: Colors.deepPurple,
                        size: 18,
                      ),
                      Text('${e.rvRating.ratingAvg.toString()} '),
                      Text('(${e.rvRating.ratingCount})'),
                    ],
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  Row(
                    children: <Widget>[
                      Text('Seatbelts ${e.rvNoOfSeatbelts}'),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          '•',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text('Sleeps ${e.rvNoOfPeopleCanSleep}'),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          '•',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text('${e.rvSize.toString()} ft'),
                    ],
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  Text(
                    '\$${e.rvPricePerNight.toString()} /night',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget modalBottomSheetContent(BuildContext context, RV e) {
    return Stack(
      children: [

        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                child: Image.network(e.rvPhotoURL),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      e.rvDisplayName,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          color: Colors.deepPurple,
                          size: 18,
                        ),
                        Text(
                            '${e.rvRating.ratingAvg.toString()} '),
                        Text('(${e.rvRating.ratingCount})'),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text('Seatbelts ${e.rvNoOfSeatbelts} '),
                        Center(
                          child: Text(
                            '•',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        Text(' ${e.rvSize.toString()} '),
                        Center(
                          child: Text(
                            '•',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        Text(' Year ${e.rvYearMade}'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[
                  Container(
                    width: 30,
                    height: 30,
                    color: Colors.pink,
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[
                  Container(
                    width: 30,
                    height: 30,
                    color: Colors.pink,
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}


