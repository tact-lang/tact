struct BoolOptional {
  x: Bool;
  y: Bool?;
}

contract BoolOptionalTest {
  data: BoolOptional;

  init() {
    self.data = BoolOptional{
      x: false,
      y: null
    };
  }
}