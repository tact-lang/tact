struct InnerMost {
  foo: Int;
}

struct Mid {
  im: InnerMost;
}

struct OuterMost {
  mid: Mid;
}

contract DeepOpt {
  data: OuterMost?;

  init() {
    self.data = null;
  }
}