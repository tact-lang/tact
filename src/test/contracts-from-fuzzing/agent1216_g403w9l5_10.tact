struct UnusualOrder {
  str: String;
  b: Bool;
  num: Int;
  opt: Int?;
  b2: Bool;
  str2: String;
}

contract OrderTest {
  u: UnusualOrder;

  init() {
    self.u = UnusualOrder{
      str: "a",
      b: true,
      num: 10,
      opt: null,
      b2: false,
      str2: "b",
    };
  }
}