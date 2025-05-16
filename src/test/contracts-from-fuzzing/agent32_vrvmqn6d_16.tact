struct Position {
  x: Int as int64;
  y: Int as int64;
  z: Int as int64;
}

contract Test {
  pos: Position;
  init() {
    self.pos = Position{x:1,y:2,z:3};
  }
}