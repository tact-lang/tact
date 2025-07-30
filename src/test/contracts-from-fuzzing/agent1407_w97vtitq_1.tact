struct Nested {
  level1: Int;
  level2: Int?;
}

contract DeepStorage {
  s: Nested;

  init() {
    self.s = Nested{
      level1: 1,
      level2: null,
    };
  }
}