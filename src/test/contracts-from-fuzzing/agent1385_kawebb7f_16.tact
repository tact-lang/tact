struct Level3 {
  z: Int;
}

struct Level2 {
  y: Level3;
}

struct Level1 {
  x: Level2;
}

contract InitDeep {
  val: Level1;

  init() {
    self.val = Level1 { x: Level2{ y: Level3{ z: 99 } } };
  }
}