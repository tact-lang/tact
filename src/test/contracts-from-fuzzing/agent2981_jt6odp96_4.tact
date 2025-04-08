struct Level3 {
  f3a: Int;
  f3b: Bool?;
}

struct Level2 {
  f2x: Int;
  f2y: Level3;
}

struct Level1 {
  f1x: Level2;
  f1y: Int;
}

contract DeepNest {
  info: Level1;

  init() {
    self.info = Level1{
      f1x: Level2{
        f2x: 5,
        f2y: Level3{
          f3a: 99,
          f3b: null,
        },
      },
      f1y: 66,
    };
  }
}