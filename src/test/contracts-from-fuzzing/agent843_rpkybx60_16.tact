struct ComplexNest {
  x: Int?;
  y: Bool?;
}

contract OptionalStructInOptional {
  a: ComplexNest?;

  init() {
    self.a = null;
  }
}
