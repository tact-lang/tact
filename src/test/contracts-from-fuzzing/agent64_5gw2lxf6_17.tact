struct Defaulted {
  x: Int = 42;
  y: String = "foo";
}

contract UsesDefault {
  data: Defaulted;

  init() {
    self.data = Defaulted{};
  }
}