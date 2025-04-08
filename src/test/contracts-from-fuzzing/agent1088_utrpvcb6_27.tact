struct Defaulted {
  x: Int = 7;
}

contract DefaultedField {
  val: Defaulted;
  init() {
    self.val = Defaulted{};
  }
}