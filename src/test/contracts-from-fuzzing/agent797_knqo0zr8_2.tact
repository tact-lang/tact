struct Level3 {
  val: Int;
}

struct Level2 {
  lvl3: Level3;
}

struct Level1 {
  lvl2: Level2;
}

contract MultiLevelNest {
  nest: Level1;

  init() {
    self.nest = Level1{ lvl2: Level2{ lvl3: Level3{ val: 10 } } };
  }
}
