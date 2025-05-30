struct DefaultsVar {
  foo: Int = 1;
  bar: Bool = false;
  str: String = "hi";
}

contract TestDefaultsVar {
  d: DefaultsVar;

  init() {
    self.d = DefaultsVar{};
  }
}
