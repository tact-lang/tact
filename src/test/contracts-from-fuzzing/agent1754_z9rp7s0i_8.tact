struct Defaulted {
  foo: Int = 42;
  bar: String = "bar";
  baz: Bool = true;
}

contract DefaultTest {
  val: Defaulted;
  init() {
    self.val = Defaulted{};
  }
}