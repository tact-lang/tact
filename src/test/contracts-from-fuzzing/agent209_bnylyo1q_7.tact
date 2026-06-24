struct NestedOpt {
  a: Int?;
  b: Inner?;
}

struct Inner {
  x: Int;
  y: Bool?;
}

contract TestContract {
  data: NestedOpt;

  init() {
    self.data = NestedOpt{
      a: null,
      b: null
    };
  }
}