contract DefaultsVsInit {
  foo: Int = 10;
  bar: Int;

  init() {
    self.bar = 20;
    self.foo = 30;
  }
}
