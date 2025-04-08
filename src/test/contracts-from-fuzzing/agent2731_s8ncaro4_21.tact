struct Level3 {
  x: Int;
  y: String;
}

struct Level2 {
  l3: Level3;
  b: Bool;
}

struct Level1 {
  l2: Level2;
  a: Int;
}

contract SuperDeep {
  root: Level1;

  init() {
    self.root = Level1{
      l2: Level2{
        l3: Level3{x:42,y:"hi"},
        b: true
      },
      a: 100
    };
  }
}