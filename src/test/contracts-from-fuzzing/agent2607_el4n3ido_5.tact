struct DefaultVals {
  foo: Int = 42;
  bar: Bool = false;
  baz: String = "hello";
}

contract DefaultValsTest {
  dat: DefaultVals;

  init() {
    self.dat = DefaultVals{};
  }
}
