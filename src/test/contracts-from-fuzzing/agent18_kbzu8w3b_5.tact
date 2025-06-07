struct Level1 {
  v: Int;
}

struct Level2 {
  l1: Level1;
}

struct Level3 {
  l2: Level2;
}

struct Level4 {
  l3: Level3;
}

struct Level5 {
  l4: Level4;
}

contract TestDeepChain {
  receive() {
    let d: Level5 = Level5{
      l4: Level4{
        l3: Level3{
          l2: Level2{
            l1: Level1{ v: 999 }
          }
        }
      }
    };
  }
}
