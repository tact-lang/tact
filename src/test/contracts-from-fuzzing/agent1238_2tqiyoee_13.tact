struct Level1 {
  f1: Int;
}

struct Level2 {
  f2: Level1;
}

struct Level3 {
  f3: Level2;
}

contract MultiLevelStructsTest {
  root: Level3;

  init() {
    self.root = Level3{
      f3: Level2{
        f2: Level1{ f1: 1 }
      }
    };
  }
}