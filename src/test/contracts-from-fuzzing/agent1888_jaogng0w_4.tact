struct Level3 {
  x: Int;
}

struct Level2 {
  l31: Level3;
  l32: Level3;
}

struct Level1 {
  l21: Level2;
  l22: Level2;
}

contract VeryDeepNested {
  deep: Level1;

  init() {
    self.deep = Level1{
      l21: Level2{
        l31: Level3{x:1},
        l32: Level3{x:2}
      },
      l22: Level2{
        l31: Level3{x:3},
        l32: Level3{x:4}
      }
    };
  }
}
