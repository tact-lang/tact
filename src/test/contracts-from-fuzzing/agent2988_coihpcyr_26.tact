contract LazyInit {
  a: Int;
  b: Int;
  init() {
    self.a = 111;
    self.b = 222;
  }
}