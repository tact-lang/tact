struct Level3 {
  f: Int;
  b: Bool;
}

struct Level2 {
  l3: Level3;
  s: String;
}

struct Level1 {
  l2: Level2;
  addr: Address;
}

contract DeepTree {
  root: Level1;

  init() {
    self.root = Level1{
      l2: Level2{
        l3: Level3{ f:5, b:true },
        s: "ok"
      },
      addr: myAddress()
    };
  }

  receive() {}
}