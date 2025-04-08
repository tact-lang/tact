struct Inner { value: Int }

contract MultiVars {
  one: Int;
  two: String;
  opt: Int?;
  nested: Inner;
  optInner: Inner?;

  init() {
    self.one = 1;
    self.two = "two";
    self.opt = null;
    self.nested = Inner{ value: 42 };
    self.optInner = null;
  }
}