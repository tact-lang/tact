struct Level3 {
  value: Int;
}

struct Level2 {
  l3: Level3;
}

struct Level1 {
  l2: Level2;
}

struct Top {
  l1: Level1;
}

contract MultiLayeredNested {
  storage: Top;

  init() {
    self.storage = Top{
      l1: Level1{
        l2: Level2{
          l3: Level3{
            value: 999
          }
        }
      }
    };
  }
}