struct Level3 {
  v1: Int;
  v2: Int?;
}

struct Level2 {
  l3a: Level3;
  l3b: Level3;
}

struct Level1 {
  l2: Level2;
}

contract DeepNesting {
  storage: Level1;
  init() {
    self.storage = Level1{
      l2: Level2{
        l3a: Level3{ v1: 1, v2: null },
        l3b: Level3{ v1: 2, v2: null }
      }
    };
  }
}