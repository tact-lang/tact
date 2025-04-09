struct Defaults {
  a: Int = 7;
  b: Bool = true;
  c: Int? = null;
  d: Bool? = false;
}

contract TestContract {
  data: Defaults;

  init() {
    self.data = Defaults{};
  }
}