contract StringMix {
  foo: String;
  bar: String?;
  baz: Bool;
  num: Int;

  init() {
    self.foo = "str";
    self.bar = null;
    self.baz = true;
    self.num = 256;
  }
}