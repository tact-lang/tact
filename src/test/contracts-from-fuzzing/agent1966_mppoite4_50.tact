struct Defs {
  a: Int = 0;
  b: Int = 1;
}

struct Wrap {
  d: Defs;
}

contract DefWrap {
  s: Wrap;

  init() {
    self.s = Wrap{
      d: Defs{}
    };
  }
}
