struct OptInside {
  val: Int?;
}

contract TestOptionalWrap {
  foo: OptInside?;

  init() {
    self.foo = OptInside{ val: null };
  }
}