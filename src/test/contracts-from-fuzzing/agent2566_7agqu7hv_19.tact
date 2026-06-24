struct OptDef {
  opt: Int?;
  defopt: Int? = null;
}

contract OptNullDefaults {
  val: OptDef;

  init() {
    self.val = OptDef{};
  }
}
