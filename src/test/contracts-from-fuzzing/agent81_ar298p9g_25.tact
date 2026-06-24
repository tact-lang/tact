struct DeepNest {
  level1: Level1;
}

struct Level1 {
  level2: Level2;
}

struct Level2 {
  level3: Level3;
}

struct Level3 {
  value: Int;
}

contract TestContract {
  nested: DeepNest;

  init() {
    self.nested = DeepNest{ level1: Level1{ level2: Level2{ level3: Level3{ value: 42 } } } };
  }
}