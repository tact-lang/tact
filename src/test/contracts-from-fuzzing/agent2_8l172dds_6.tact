struct OptionalNested {
  x: Int?;
  y: Bool?;
  z: String?;
}

struct OuterOpt {
  innerOpt: OptionalNested?;
  a: Int;
}

contract Test {
  testField: OuterOpt;

  init() {
    self.testField = OuterOpt{
      innerOpt: null,
      a: 11
    };
  }
}