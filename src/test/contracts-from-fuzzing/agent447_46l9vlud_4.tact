struct VeryDeep {
  d: Int;
}

struct Level3 {
  c: VeryDeep;
}

struct Level2 {
  b: Level3;
}

struct Level1 {
  a: Level2;
}

contract MultiNest {
  field: Level1;

  init() {
    self.field = Level1{ a: Level2{ b: Level3{ c: VeryDeep{ d: 123 } } } };
  }
}