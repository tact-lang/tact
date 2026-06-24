struct OptNested {
  x: Int?;
  y: Bool?;
  z: String?;
}

contract OptNestedTest {
  data: OptNested;

  init() {
    self.data = OptNested{
      x: null,
      y: true,
      z: "hello"
    };
  }
}