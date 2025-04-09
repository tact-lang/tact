struct LevelOne {
  levelTwo: LevelTwo;
}

struct LevelTwo {
  levelThree: LevelThree;
}

struct LevelThree {
  a: Int;
  b: Bool?;
}

contract StructOptDeep {
  l1: LevelOne;

  init() {
    self.l1 = LevelOne{ levelTwo: LevelTwo{ levelThree: LevelThree{ a: 1, b: null } } };
  }
}