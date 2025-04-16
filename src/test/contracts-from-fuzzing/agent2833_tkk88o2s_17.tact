contract InitDefaults {
  foo: Int = 17;
  bar: Bool = true;
  txt: String = "hi";

  init() {
    self.foo = 42;
    self.bar = false;
    self.txt = "bye";
  }
}