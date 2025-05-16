struct Level3 {
  c: Int;
}

struct Level2 {
  b: Level3;
}

struct Level1 {
  a: Level2;
}

contract DeepNest {
  nested: Level1;

  init() {
    self.nested = Level1{
      a: Level2{ b: Level3{ c: 123 } }
    };
  }
}