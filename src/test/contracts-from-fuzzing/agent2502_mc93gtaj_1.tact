struct Coordinates {
  latitude: Int;
  longitude: Int;
}

contract NestedStructTest {
  coords: Coordinates;

  init() {
    self.coords = Coordinates{latitude: 0, longitude: 0};
  }
}