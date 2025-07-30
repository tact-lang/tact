contract NestedDefaults {
  foo: Int = 1;
  opt1: Int? = null;
  opt2: Int? = null;
  str: String = "hi";

  init() {
    self.foo = 42;
    self.opt1 = 5;
    self.opt2 = null;
    self.str = "bye";
  }
}