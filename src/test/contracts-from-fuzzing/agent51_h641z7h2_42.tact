struct Wrap {
  s: String = "abc";
}

contract Test {
  a: Int = 1;
  w: Wrap;
  b: Bool = false;
  s: String = "x";

  init() {
    self.w = Wrap{};
  }
}