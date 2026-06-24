struct Level2 {
  c: Int;
  d: Bool;
}

struct Level1 {
  a: Int;
  b: Level2;
}

contract NestedContract {
  data: Level1;

  init() {
    self.data = Level1{
      a: 42,
      b: Level2{ c: 7, d: false }
    };
  }
}
