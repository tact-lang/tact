struct Level2 {
  a: Int;
  b: Bool;
}

struct Level1 {
  l2_1: Level2;
  l2_2: Level2;
}

contract NestedLayered {
  l1a: Level1;
  l1b: Level1;

  init() {
    self.l1a = Level1{l2_1: Level2{a:1,b:true}, l2_2: Level2{a:2,b:false}};
    self.l1b = Level1{l2_1: Level2{a:3,b:true}, l2_2: Level2{a:4,b:false}};
  }
}