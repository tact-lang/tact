struct Level3 {
  f: Int;
}

struct Level2 {
  l3a: Level3;
  l3b: Level3;
}

struct Level1 {
  l2: Level2;
}

contract Multilevel {
  nested: Level1;
  init() {
    self.nested = Level1{
      l2: Level2{
        l3a: Level3{f:1},
        l3b: Level3{f:2}
      }
    };
  }
}