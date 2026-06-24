struct Coord {
  x: Int as int64;
  y: Int as int64;
}

contract SerializedStruct {
  s: Coord;

  init() {
    self.s = Coord{x:1,y:2};
  }
}