struct NestedDefaults {
  a: Int = 5;
  b: Bool = false;
}

contract HasNestedDefaults {
  f: NestedDefaults;

  init() {
    self.f = NestedDefaults{ a:42, b:true };
  }
}