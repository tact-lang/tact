struct Rich {
  a: Int as uint4 = 1;
  b: Bool = true;
  c: String = "hi";
}

contract OptionalRich {
  info: Rich?;

  init() {
    self.info = null;
  }
}
