struct Flags {
  a: Bool;
  b: Bool;
  c: Bool;
  d: Bool?
}

contract BoolFieldsTest {
  f: Flags;

  init() {
    self.f = Flags{
      a: true,
      b: false,
      c: true,
      d: null,
    };
  }
}