struct InnerOpt {
  x: Int;
}

struct Outer {
  inner: InnerOpt?;
}

contract NestedOptionalField {
  data: Outer;

  init() {
    self.data = Outer{
      inner: InnerOpt{ x: 9 }
    };
  }
}
