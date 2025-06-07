struct ManyOptionalDefaults {
  a: Int? = null;
  b: Bool? = null;
  c: Address? = null;
}

contract TestContract {
  m: ManyOptionalDefaults;

  init() {
    self.m = ManyOptionalDefaults{};
  }
}