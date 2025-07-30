struct Level3 {
  f1: Int;
  f2: Bool;
}

struct Level2 {
  l3a: Level3;
  l3b: Level3;
}

struct Level1 {
  l2: Level2;
  x: Int;
}

contract Chain {
  state: Level1;
  init() {
    self.state = Level1{
      l2: Level2{
        l3a: Level3{f1:1, f2:true},
        l3b: Level3{f1:2, f2:false}
      },
      x: 5
    };
  }
}
