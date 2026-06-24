struct Inner { y: Int?; }
contract X {
  a: Int;
  s: Inner;
  init() {
    self.a = 1;
    self.s = Inner{ y: null };
  }
}