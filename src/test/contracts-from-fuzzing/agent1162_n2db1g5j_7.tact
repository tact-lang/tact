struct Level3 {
  a: Int;
}

struct Level2 {
  l3_1: Level3;
  l3_2: Level3;
}

struct Level1 {
  l2_1: Level2;
  l2_2: Level2;
}

contract MultiNested {
  top: Level1;

  init() {
    self.top = Level1{
      l2_1: Level2{
        l3_1: Level3{a:1},
        l3_2: Level3{a:2},
      },
      l2_2: Level2{
        l3_1: Level3{a:3},
        l3_2: Level3{a:4},
      },
    };
  }
}