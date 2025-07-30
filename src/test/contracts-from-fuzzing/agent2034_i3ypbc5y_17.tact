struct Level1 {
  a: Int;
  b: Int;
}

struct Level2 {
  l1a: Level1;
  l1b: Level1;
}

struct Level3 {
  l2a: Level2;
  l2b: Level2;
}

contract TreeStruct {
  root: Level3;

  init() {
    self.root = Level3{
      l2a: Level2{
        l1a: Level1{ a:1, b:2 },
        l1b: Level1{ a:3, b:4 }
      },
      l2b: Level2{
        l1a: Level1{ a:5, b:6 },
        l1b: Level1{ a:7, b:8 }
      }
    };
  }
}