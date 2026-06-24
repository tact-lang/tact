struct Level2 {
  y: Int;
}

struct Level1 {
  x: Level2;
}

contract PreInit {
  st: Level1 = Level1{ x: Level2{ y: 5 } };

  init() {
    self.st = Level1{ x: Level2{ y: 7 } };
  }
}