struct NestedOpt {
  x: Int?;
  y: String?;
}

struct ComplexOpt {
  a: NestedOpt?;
  b: String;
}

contract Test {
  data: ComplexOpt;

  init() {
    self.data = ComplexOpt{
      a: null,
      b: "hello",
    };
  }
}