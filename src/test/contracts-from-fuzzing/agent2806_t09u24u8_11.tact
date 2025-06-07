struct Combined {
  a: Int;
  b: Bool = false;
  c: String?;
  d: Bool? = null;
}

contract ComboTest {
  field: Combined;

  init() {
    self.field = Combined{
      a: 99,
      b: true,
      c: "text",
      d: true
    };
  }
}