struct DeepChain {
  a: Level1;
}

struct Level1 {
  b: Level2;
}

struct Level2 {
  c: Level3;
}

struct Level3 {
  d: Level4;
}

struct Level4 {
  val: Int;
}

contract TestContract {
  chain: DeepChain;

  init() {
    self.chain = DeepChain{
      a: Level1{
        b: Level2{
          c: Level3{
            d: Level4{ val: 123 }
          }
        }
      }
    };
  }
}