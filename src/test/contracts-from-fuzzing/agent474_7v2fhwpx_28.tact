struct Coord {
  lat: Int;
  lon: Int;
}

contract MultCoord {
  pos1: Coord;
  pos2: Coord;
  pos3: Coord;

  init() {
    self.pos1 = Coord{lat:1, lon:2};
    self.pos2 = Coord{lat:3, lon:4};
    self.pos3 = Coord{lat:5, lon:6};
  }
}
