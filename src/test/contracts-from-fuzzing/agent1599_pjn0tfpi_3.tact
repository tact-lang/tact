struct DeepNest {
  level1: Int;
  level2: Level2;
}

struct Level2 {
  level3: Level3;
}

struct Level3 {
  value: Bool;
}

contract Test {
  field: DeepNest;

  init() {
    self.field = DeepNest{
      level1: 5,
      level2: Level2{
        level3: Level3{
          value: false,
        },
      },
    };
  }
}
