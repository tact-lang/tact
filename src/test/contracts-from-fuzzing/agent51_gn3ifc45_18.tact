struct Plain {
  a: Int;
  b: Int;
}

contract FieldsWithDefaults {
  f: Plain = Plain{a:1,b:2};
  init() {
    self.f = Plain{a:5,b:6};
  }
}
