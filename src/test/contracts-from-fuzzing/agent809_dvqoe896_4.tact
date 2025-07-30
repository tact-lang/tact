struct InnerMost {
  d: Int;
}

struct Level2 {
  c: InnerMost;
}

struct Level1 {
  b: Level2;
}

contract DeepContract {
  a: Level1;

  init() {
    self.a = Level1{
      b: Level2{
        c: InnerMost{ d: 42 },
      },
    };
  }
}
