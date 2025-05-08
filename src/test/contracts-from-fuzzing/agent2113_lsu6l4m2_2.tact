struct Level3 {
  val3: Int;
}

struct Level2 {
  inner3: Level3;
}

struct Level1 {
  inner2: Level2;
}

contract MultiLevelNesting {
  nested: Level1;

  init() {
    self.nested = Level1{
      inner2: Level2{
        inner3: Level3{
          val3: 123
        }
      }
    };
  }
}