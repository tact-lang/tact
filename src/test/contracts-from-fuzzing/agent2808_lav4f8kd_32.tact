struct InnerMost {
  val: Int;
}

struct Mid {
  a: InnerMost?;
  b: InnerMost?;
}

struct Outer {
  mid: Mid?;
}

contract Test {
  state: Outer;
  init() {
    self.state = Outer{ mid: null };
  }
}