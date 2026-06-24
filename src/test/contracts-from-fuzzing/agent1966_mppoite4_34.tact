struct OptS {
  s: Int?;
}

struct NestedOptS {
  a: OptS;
  b: OptS;
}

contract OptStructOpt {
  storage: NestedOptS;

  init() {
    self.storage = NestedOptS{
      a: OptS{ s: null },
      b: OptS{ s: null }
    };
  }
}
