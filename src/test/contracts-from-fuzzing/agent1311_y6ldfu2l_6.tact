struct Level3 {
  a: Int;
}

struct Level2 {
  l3_1: Level3;
  l3_2: Level3;
  b: Bool;
}

struct Level1 {
  l2a: Level2;
  l2b: Level2;
}

contract MultiNested {
  state: Level1;
  init() {
    self.state = Level1{
      l2a: Level2{
        l3_1: Level3{a: 1},
        l3_2: Level3{a: 2},
        b: true,
      },
      l2b: Level2{
        l3_1: Level3{a: 3},
        l3_2: Level3{a: 4},
        b: false,
      }
    };
  }
}