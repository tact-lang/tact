struct ComplexOpt {
  i: Int?;
  s: String?;
  b: Bool?;
}

contract ComplexOptField {
  complex: ComplexOpt?;

  init() {
    self.complex = null;
  }
}