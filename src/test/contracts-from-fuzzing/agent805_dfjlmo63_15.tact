struct DeepMulti {
  a: Int;
  b: Int;
  c: Int;
}

struct Level1A { x: DeepMulti; }
struct Level1B { y: DeepMulti; }

struct WrapBoth {
  first: Level1A;
  second: Level1B;
}

contract MultiBranchNest {
  storage: WrapBoth;

  init() {
    self.storage = WrapBoth{
      first: Level1A{ x: DeepMulti{ a:1, b:2, c:3 } },
      second: Level1B{ y: DeepMulti{ a:4, b:5, c:6 } }
    };
  }
}
