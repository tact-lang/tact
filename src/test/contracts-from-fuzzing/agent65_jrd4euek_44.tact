struct Level1 {
  x:Int;
}

struct Level2 {
  l1: Level1;
}

struct Level3 {
 l2:Level2;
}

struct Level4 {
 l3:Level3;
}

contract FourLevelContract {
  f: Level4;
  init() {
    self.f = Level4{
      l3: Level3{
        l2: Level2{
          l1: Level1{ x: 99 }
        }
      }
    };
  }
}