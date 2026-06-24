struct Inner {
  a: Int = 7;
  b: Bool?;
  c: String = "test";
}

contract Test {
  data: Inner;
  init() { self.data = Inner{}; }
}