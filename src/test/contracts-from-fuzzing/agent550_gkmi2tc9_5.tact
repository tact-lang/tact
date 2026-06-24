struct InnerMost {
  val: Int;
}

struct Middle {
  inner: InnerMost?;
}

struct Top {
  mid: Middle?;
}

contract Test {
  f1: Int;
  f2: Top?;
  init() {
    self.f1 = 42;
    self.f2 = Top{ mid: null };
  }
}