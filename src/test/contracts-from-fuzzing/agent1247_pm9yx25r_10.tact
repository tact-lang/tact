struct Level3 {
  x: Int;
}

struct Level2 {
  inner: Level3;
  y: Bool;
}

struct Level1 {
  nested: Level2;
  z: Address;
}

contract DeepChain {
  data: Level1;

  init() {
    self.data = Level1{
      nested: Level2{
        inner: Level3{ x: 99 },
        y: true
      },
      z: myAddress()
    };
  }
}