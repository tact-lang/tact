struct Rich {
  a: Int as uint4 = 1;
  b: Bool = true;
  c: String = "hi";
}

contract OptionalRichAssigned {
  info: Rich?;

  init() {
    self.info = Rich{
      a: 3,
      c: "hello"
    };
  }
}
