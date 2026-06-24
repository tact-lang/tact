struct Coordinates {
  lat: Int as int64;
  lon: Int as int64;
}

struct Location {
  label: String;
  coords: Coordinates;
}

contract SerializeHints {
  loc: Location = Location{
    label: "here",
    coords: Coordinates{lat:0,lon:0}
  };
}