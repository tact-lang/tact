struct LevelOne {
  f: Int;
}

struct LevelTwo {
  l1: LevelOne;
}

struct LevelThree {
  l2: LevelTwo;
}

contract TripleStructWrap {
  content: LevelThree;
  init() {
    self.content = LevelThree{
      l2: LevelTwo{
        l1: LevelOne{
          f: 7
        }
      }
    };
  }
}