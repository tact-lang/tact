struct InnerMost {
  x: Int = 1;
}

struct Mid {
  im: InnerMost = InnerMost{};
}

struct Outer {
  midOpt: Mid? = Mid{ im: InnerMost{ x: 99 } };
}

contract OptNestedDefault {
  data: Outer;

  init() {
    self.data = Outer{};
  }
}