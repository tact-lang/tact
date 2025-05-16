struct OptionalAndDefault {
  x: Int? = null;
  y: Int = 99;
  z: Bool? = null;
}

contract TestContract {
  data: OptionalAndDefault;
  init() {
    self.data = OptionalAndDefault{};
  }
}