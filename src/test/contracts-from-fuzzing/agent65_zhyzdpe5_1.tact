struct Nested {
  level2: Level2;
}

struct Level2 {
  deepField: Int;
}

contract DeepStorage {
  nested: Nested;
  init() {
    self.nested = Nested{ level2: Level2{ deepField: 1 } };
  }
}