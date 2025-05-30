struct Level3 {
  v1: Int;
}

struct Level2 {
  l3a: Level3;
  l3b: Level3;
}

struct Level1 {
  l2a: Level2;
  l2b: Level2;
}

contract DeeplyNested {
  field: Level1;

  init() {
    self.field = Level1{
      l2a: Level2{l3a: Level3{v1:1}, l3b: Level3{v1:2}},
      l2b: Level2{l3a: Level3{v1:3}, l3b: Level3{v1:4}}
    };
  }
}