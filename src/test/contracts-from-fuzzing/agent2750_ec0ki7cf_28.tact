struct Level3 {
  f3: Int;
}

struct Level2 {
  f2: Level3;
}

struct Level1 {
  f1: Level2;
}

contract Deep3 {
  root: Level1;
  init() {
    self.root = Level1 {
      f1: Level2 {
        f2: Level3 {
          f3: 42
        }
      }
    };
  }
}
