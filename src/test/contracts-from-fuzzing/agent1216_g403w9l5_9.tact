struct SOpt {
  i: Int?;
  b: Bool?;
  s: String;
}

contract OptionalTest {
  s: SOpt;

  init() {
    self.s = SOpt{
      i: null,
      b: null,
      s: "hello",
    };
  }
}