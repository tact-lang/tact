struct Level1 {
  a: Int;
  b: String;
}

struct Level2 {
  l1a: Level1;
  l1b: Level1;
}

struct Level3 {
  l2a: Level2;
  l2b: Level2;
}

contract DoubleWide {
  deep: Level3;

  init() {
    self.deep = Level3{
      l2a: Level2{
        l1a: Level1{a:1,b:"x"},
        l1b: Level1{a:2,b:"y"}
      },
      l2b: Level2{
        l1a: Level1{a:3,b:"z"},
        l1b: Level1{a:4,b:"w"}
      }
    };
  }
}