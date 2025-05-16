struct Nested {
  x: Int;
  y: Bool?;
  s: String;
}

contract ComplexOptionalTest {
  data: Nested?;

  init() {
    self.data = Nested{
      x: 1,
      y: true,
      s: "ok"
    };
  }
}