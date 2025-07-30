struct Inline {
  x: Int;
  y: Int;
}

contract InlineTest {
  info: Inline;

  init() {
    self.info = Inline{ x: 3, y: 4 };
  }
}