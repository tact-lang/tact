struct LevelOne {
  x: Int;
}

struct LevelTwo {
  l1: LevelOne;
}

struct LevelThree {
  l2: LevelTwo;
}

contract ContractWithLevels {
  info: LevelThree = LevelThree{
    l2: LevelTwo{
      l1: LevelOne{ x: 777 }
    }
  };
}