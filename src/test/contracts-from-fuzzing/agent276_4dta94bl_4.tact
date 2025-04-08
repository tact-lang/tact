struct Inner {
  val: Int?;
}

struct Outer {
  nestedOpt: Inner?;
}

contract DoubleOptPrimitive {
  stuff: Outer;

  init() {
    self.stuff = Outer{
      nestedOpt: null,
    };
  }
}
