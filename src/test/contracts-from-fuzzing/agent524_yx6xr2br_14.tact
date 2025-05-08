struct Coordinates {
  lat: Int as int64;
  lon: Int as int64;
}

contract MixedSerialization {
  coord: Coordinates;

  init() {
    self.coord = Coordinates{ lat: 123, lon: 456 };
  }
}