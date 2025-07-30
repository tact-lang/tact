struct Level2 {
  d: Int;
}

struct Level1 {
  c: Level2;
}

contract Test {
  nested: Level1;

  init() {
    self.nested = Level1{c: Level2{d: 5}};
  }
}