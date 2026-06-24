struct Level2 {
  inner: Int;
}

struct Level1 {
  lvl2: Level2;
}

contract DeepNest {
  nest: Level1;

  init() {
    self.nest = Level1{ lvl2: Level2{ inner: 123 } };
  }
}
