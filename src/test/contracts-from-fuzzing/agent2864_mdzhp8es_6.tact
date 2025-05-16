struct Level1 {
  a1: Int;
}

struct Level2 {
  a2: Level1;
}

struct Level3 {
  a3: Level2;
}

struct Level4 {
  a4: Level3;
}

contract DeepNest {
  n: Level4;

  init() {
    self.n = Level4{ a4: Level3{ a3: Level2{ a2: Level1{ a1: 123 } } } };
  }
}