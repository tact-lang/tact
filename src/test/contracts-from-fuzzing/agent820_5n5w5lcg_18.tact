struct ComplexOptionalDefault {
  x: Int? = null;
  y: Bool? = true;
  z: Address? = null;
  s1: Inner?
}

struct Inner {
  foo: Int? = 42;
  bar: Bool? = null;
}

contract TestContract {
  nested: ComplexOptionalDefault;
  init() {
    self.nested = ComplexOptionalDefault{
      y: false,
      s1: Inner{}
    };
  }
}