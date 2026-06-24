struct WideDefault {
  a: Int = 1;
  b: Int = 2;
  c: Int = 3;
  d: Int = 4;
  e: Int = 5;
  f: Int = 6;
  g: Int = 7;
  h: Int = 8;
}

contract DefaultWide {
  d: WideDefault;

  init() {
    self.d = WideDefault{};
  }
}