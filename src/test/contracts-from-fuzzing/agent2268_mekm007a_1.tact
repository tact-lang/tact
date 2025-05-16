struct OptionalNested {
  x: Int?;
  y: Bool?;
}

contract OptTest {
  data: OptionalNested;

  init() {
    self.data = OptionalNested {
      x: null,
      y: true
    };
  }
}