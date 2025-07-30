struct MultipleDefaults {
  a: Int = 1;
  b: Bool = true;
  c: String = "ok";
  d: Int? = null;
  e: String? = null;
}

contract TestContract {
  def: MultipleDefaults;

  init() {
    self.def = MultipleDefaults{};
  }
}