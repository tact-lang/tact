struct Inner {
  s: String;
  f: Bool;
}

struct Mid {
  i: Int;
  inner: Inner;
}

contract StringsAndBools {
  m: Mid;

  init() {
    self.m = Mid{
      i: 123,
      inner: Inner{ s:"hi", f:true }
    };
  }
}