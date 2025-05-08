struct Level3 {
  d: Int?;
}

struct Level2 {
  c: Bool;
  lvl3: Level3;
}

struct Level1 {
  a: Int;
  b: Level2;
}

contract DeepNestedContract {
  storage: Level1;

  init() {
    self.storage = Level1{
      a: 42,
      b: Level2{
        c: false,
        lvl3: Level3{ d: null }
      }
    };
  }
}
