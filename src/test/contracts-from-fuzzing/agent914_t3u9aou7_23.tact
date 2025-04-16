struct Inner {
  i: Int;
}

struct Mid {
  i: Inner;
}

struct Outer {
  m: Mid;
}

contract DeepChain {
  v: Outer;

  init() {
    self.v = Outer{m: Mid{i: Inner{i: 123}}};
  }
}