struct Defaults {
  a: Int = 1;
  b: Bool = false;
  c: Int? = null;
  d: Bool? = null;
}

contract DefaultsTest {
  state: Defaults;

  init() {
    self.state = Defaults{}; // should get defaults
  }
}