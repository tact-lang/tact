struct Innermost {
  v: Int;
}

struct Inner {
  im: Innermost;
}

struct Mid {
  inner: Inner;
}

struct Outer {
  mid: Mid;
}

contract UltraDeep {
  outer: Outer;

  init() {
    self.outer = Outer{ mid: Mid{ inner: Inner{ im: Innermost{v: 100} } } };
  }
}