struct Mix {
  a: Int;
  b: Int?;
  c: Bool;
  d: Bool?;
}

contract TestContract {
  stored: Mix;

  init() {
    self.stored = Mix{
      a: 1,
      b: null,
      c: false,
      d: true
    };
  }

  receive() {
    self.stored = self.stored;
  }
}