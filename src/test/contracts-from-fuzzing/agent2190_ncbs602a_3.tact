struct Level3 {
  a: Int;
  b: Bool;
}

struct Level2 {
  l3a: Level3;
  l3b: Level3;
}

struct Level1 {
  l2a: Level2;
  l2b: Level2;
}

contract FourLayerDeep {
  state: Level1;

  init() {
    self.state = Level1{
      l2a: Level2{
        l3a: Level3{a:1, b:true},
        l3b: Level3{a:2, b:false}
      },
      l2b: Level2{
        l3a: Level3{a:3, b:true},
        l3b: Level3{a:4, b:false}
      }
    };
  }
}