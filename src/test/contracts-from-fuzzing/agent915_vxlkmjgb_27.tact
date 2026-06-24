struct OptDef {
  a: Int?;
  b: Int? = 42;
}

contract OptDefaults {
  f: OptDef;

  init() {
    self.f = OptDef{
      a: null
    };
  }
}
