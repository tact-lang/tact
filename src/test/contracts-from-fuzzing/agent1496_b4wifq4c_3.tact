struct Level3 {
  f3a: Int;
  f3b: Bool;
}

struct Level2 {
  f2a: Int;
  f2b: Level3;
}

struct Level1 {
  f1a: Bool;
  f1b: Level2;
}

contract NestedLayersTest {
  nested: Level1;

  init() {
    self.nested = Level1{
        f1a: false,
        f1b: Level2{
            f2a: 42,
            f2b: Level3{
                f3a: 99,
                f3b: true
            }
        }
    };
  }
}