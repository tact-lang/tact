// deeply nested mixed optional and required fields
struct LevelTwo {
  a: Int;
  b: Bool?;
}

struct LevelOne {
  inner: LevelTwo?;
  flag: Bool;
}

contract MixedNested {
  data: LevelOne;

  init() {
    self.data = LevelOne{ inner: null, flag: false };
  }
}