struct Level3 {
  a: Int;
}

struct Level2 {
  lvl3: Level3;
}

struct Level1 {
  lvl2: Level2;
}

contract DeepDeep {
  nested: Level1;

  init() {
    self.nested = Level1{ lvl2: Level2{ lvl3: Level3{ a: 42 } } };
  }
}