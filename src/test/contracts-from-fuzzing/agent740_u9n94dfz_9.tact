struct OptionalNested {
 inner: InnerS?;
}

struct InnerS {
  x: Int;
  y: Bool;
}

contract OptNestedContract {
  opt: OptionalNested;
  init() {
    self.opt = OptionalNested{};
  }
}