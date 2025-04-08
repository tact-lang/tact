struct OptDef {
  x: Int? = null;
  y: Bool? = true;
}

contract TestContract {
  data: OptDef;

  init() {
    self.data = OptDef{};
  }
}