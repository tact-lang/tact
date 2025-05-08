struct SInner {
  foo: Int;
}

contract OptionalStructUsedField {
  bar: SInner?;

  init() {
    self.bar = null;
  }

  receive() {
    if (self.bar != null) {
      let x = self.bar!!;
      self.bar = SInner{foo: x.foo + 1};
    } else {
      self.bar = SInner{foo:0};
    }
  }
}