struct DoubleOpt {
  a: Int?;
  b: Bool?;
}

contract DoubleNullableFields {
  foo: DoubleOpt?;

  init() {
    self.foo = null;
  }
}