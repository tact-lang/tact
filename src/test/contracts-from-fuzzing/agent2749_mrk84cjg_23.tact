struct WeirdLayout1 {
  a: Int;
  b: String?;
  c: Bool;
}

contract LayoutTestA {
  f: WeirdLayout1;

  init() {
    self.f = WeirdLayout1{ a: 5, b: null, c: false };
  }
}