struct ComplexDefaults {
  a: Int = 1;
  b: Bool = true;
  c: String = "abc";
  d: Int?; 
  e: Bool?;
}

contract DefaultedFields {
  s: ComplexDefaults;

  init() {
    self.s = ComplexDefaults{};
  }
}