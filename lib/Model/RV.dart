class RV {
  int rvID;
  String rvName;
  String rvDisplayName;
  Rating rvRating;
  String rvType;
  Location rvLocation;
  String rvYearMade;
  double rvSize;
  int rvNoOfSeatbelts;
  int rvNoOfPeopleCanSleep;
  List<RVTag> rvTags;
  double rvPricePerNight;
  String rvPhotoURL;

  RV(
      {required this.rvID,
      required this.rvName,
      required this.rvDisplayName,
      required this.rvRating,
      required this.rvType,
      required this.rvLocation,
      required this.rvYearMade,
      required this.rvSize,
      required this.rvNoOfPeopleCanSleep,
      required this.rvNoOfSeatbelts,
      required this.rvPricePerNight,
      required this.rvTags,
      required this.rvPhotoURL});
}

class RVTag {
  String rvTag;
  RVTag({required this.rvTag});
}

class Location {
  String cityName;
  String stateName;
  Location({required this.cityName, required this.stateName});
}

class Rating {
  double ratingAvg;
  int ratingCount;

  Rating({required this.ratingAvg, required this.ratingCount});
}
