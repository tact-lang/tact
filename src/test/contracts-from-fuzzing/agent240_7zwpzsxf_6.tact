struct Sub {
  a: Int;
}

struct Mid {
  s: Sub;
}

struct Top {
  m: Mid;
}

contract ChainNest {
  val: Top;

  init() {
    self.val = Top{ m: Mid{ s: Sub{ a: 42 } } };
  }
}
