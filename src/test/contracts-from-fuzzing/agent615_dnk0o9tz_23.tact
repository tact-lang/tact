struct InnerMost {
  v: Int;
}

struct Middle {
  inner: InnerMost;
}

struct Outer {
  mid: Middle;
}

contract TestContract {
  s: Outer;

  init() {
    self.s = Outer{ mid: Middle{ inner: InnerMost{ v: 42 } } };
  }
}