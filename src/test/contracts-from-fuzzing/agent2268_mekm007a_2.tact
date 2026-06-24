struct Level3 {
  v: Int;
}

struct Level2 {
  l3: Level3;
}

struct Level1 {
  l2: Level2;
}

contract DeepNest {
  f: Level1;

  init() {
    self.f = Level1 {
      l2: Level2 {
        l3: Level3 {
          v: 42
        }
      }
    };
  }
}