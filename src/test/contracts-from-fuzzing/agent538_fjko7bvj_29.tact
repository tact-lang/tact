struct Level1 {
  l2: Level2;
}

struct Level2 {
  l3: Level3;
}

struct Level3 {
  l4: Int = 999;
}

contract Multilevel {
  state: Level1;

  init() {
    self.state = Level1{
      l2: Level2{
        l3: Level3{
          l4: 555
        }
      }
    };
  }
}
