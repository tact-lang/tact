struct OptionalDeep {
  some: OptionalInner?;
}

struct OptionalInner {
  foo: Int?;
}

contract OptComplex {
  state: OptionalDeep;

  init() {
    self.state = OptionalDeep { some: null };
  }
}