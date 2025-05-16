struct DeepNested {
  level1: Level1;
}

struct Level1 {
  level2: Level2;
}

struct Level2 {
  level3: Level3;
}

struct Level3 {
  val: Int;
}

contract Test {
  nested: DeepNested;
  init() {
    self.nested = DeepNested{ level1: Level1{ level2: Level2{ level3: Level3{ val: 123 } } } };
  }
}