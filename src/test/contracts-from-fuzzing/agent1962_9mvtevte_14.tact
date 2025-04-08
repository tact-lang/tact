struct ReallyDeep {
  nest: Level2;
}

struct Level2 {
  nest: Level3;
}

struct Level3 {
  nest: Level4;
}

struct Level4 {
  nest: Level5;
}

struct Level5 {
  val: Int;
}

contract DeepTree {
  root: ReallyDeep;

  init() {
    self.root = ReallyDeep{ nest: Level2{ nest: Level3{ nest: Level4{ nest: Level5{ val: 5 } } } } };
  }
}