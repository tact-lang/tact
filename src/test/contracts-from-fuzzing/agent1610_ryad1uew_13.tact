struct Level3 {
  gamma: Int;
}

struct Level2 {
  beta: Level3;
}

struct Level1 {
  alpha: Level2;
}

contract MultiLevelNested {
  val: Level1;

  init() {
    self.val = Level1{
      alpha: Level2{
        beta: Level3{
          gamma: 123
        }
      }
    };
  }
}