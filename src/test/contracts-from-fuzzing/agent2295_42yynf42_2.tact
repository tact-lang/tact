struct DeepNested {
  level1: Level1;
}

struct Level1 {
  level2: Level2;
}

struct Level2 {
  level3: Level3;
}

struct Level3 {
  x: Int;
  y: String?;
}

contract Test {
  storage: DeepNested;

  init() {
    self.storage = DeepNested{
      level1: Level1{
        level2: Level2{
          level3: Level3{
            x: 42,
            y: null
          }
        }
      }
    };
  }
}