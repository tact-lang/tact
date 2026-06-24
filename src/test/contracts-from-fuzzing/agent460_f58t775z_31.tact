struct Embed {
  a: Int;
  b: Bool;
}

contract OptionalEmbedTest {
  x: Embed?;
  init() {
    self.x = null;
  }
}
