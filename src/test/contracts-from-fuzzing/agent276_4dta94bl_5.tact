struct Level3 {
  d: Int;
  e: Int;
}

struct Level2 {
  b: Int;
  c: Level3;
}

struct Level1 {
  a: Level2;
}

contract NestChain {
  val: Level1;

  init() {
    self.val = Level1{
      a: Level2{
        b: 1,
        c: Level3{
          d: 2,
          e: 3,
        },
      },
    };
  }
}
