struct X {
  a: Int;
  b: String?;
}

contract InitFields {
  data: X;

  init() {
    self.data = X{
      a: 12,
      b: "hello",
    };
  }

  receive() {
    self.data = self.data;
  }
}