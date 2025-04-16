struct DefaultOptional {
  a: Int? = null;
  b: Bool? = true;
  c: Address? = null;
}

contract OptionalDefaultsTest {
  val: DefaultOptional;

  init() {
    self.val = DefaultOptional{}; // use defaults
  }
}