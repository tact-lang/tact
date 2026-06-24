struct Level1 {
  a: Int;
}

struct Level2 {
  b: Level1;
}

struct Level3 {
  c: Level2;
}

struct Level4 {
  d: Level3;
}

struct Level5 {
  e: Level4;
}

contract DeepChain {
  chain: Level5;

  init() {
    self.chain = Level5{
      e: Level4{
        d: Level3{
          c: Level2{
            b: Level1{ a: 999 }
          }
        }
      }
    };
  }
}