struct Level3 {
  val3: Int;
}

struct Level2 {
  val2: Level3;
}

struct Level1 {
  val1: Level2;
}

contract ThreeLevelNest {
  testVal: Level1;

  init() {
    self.testVal = Level1{val1: Level2{val2: Level3{val3: 123}}};
  }
}