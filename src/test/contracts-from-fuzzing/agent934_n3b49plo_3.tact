struct Level3 {
  k: Int;
  f: Bool;
}

struct Level2 {
  l3: Level3;
}

struct Level1 {
  l2: Level2;
}

contract Test {
  deep: Level1;

  init() {
    self.deep = Level1 {
      l2: Level2 {
        l3: Level3 { k: 5, f: true }
      }
    };
  }
}