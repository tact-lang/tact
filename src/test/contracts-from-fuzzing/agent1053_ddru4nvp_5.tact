struct Level3 {
  alpha: Int?;
  beta: Bool?;
}

struct Level2 {
  l3: Level3;
  flag: Bool;
}

struct Level1 {
  l2: Level2;
  num: Int;
}

contract DeepNest {
  data: Level1;

  init() {
    self.data = Level1{
      l2: Level2{
        l3: Level3{
          alpha: 123,
          beta: true,
        },
        flag: false
      },
      num: 999
    };
  }
}