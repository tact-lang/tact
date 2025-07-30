struct OptionalPremix {
  foo: Int?;
  bar: Bool;
}

contract TestOptionalPremix {
  s: OptionalPremix;

  init() {
    self.s = OptionalPremix{foo:null, bar:true};
  }
}
