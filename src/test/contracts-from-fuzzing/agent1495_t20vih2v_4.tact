struct Level1 {
  x: Int;
}

struct Level2 {
  l1: Level1;
}

struct Level3 {
  l2: Level2;
}

contract VeryDeep {
  d: Level3;

  init() {
    self.d = Level3{ l2: Level2{ l1: Level1{ x: 42 } } };
  }
}