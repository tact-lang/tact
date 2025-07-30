// Contract with deeply nested options inside structs
struct LevelOne {
  x: Int?;
}

struct LevelTwo {
  l1: LevelOne?;
}

struct LevelThree {
  l2: LevelTwo?;
}

contract TestContract {
  deep: LevelThree?;

  init() {
    self.deep = LevelThree{
      l2: LevelTwo{
        l1: LevelOne{
          x: 42
        }
      }
    };
  }
}