struct NestedDefaults {
  a: Int = 5;
  s: InnerDefault;
}

struct InnerDefault {
  x: Int = 7;
  y: Bool = true;
}

contract TestNestedDefaults {
  f: NestedDefaults;

  init() {
    self.f = NestedDefaults{ s: InnerDefault{} };
  }
}