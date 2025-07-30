struct Defaulted {
  x: Int = 7;
  y: Bool = true;
  s: String = "hi";
}

contract DefaultsState {
  val: Defaulted;
  init() {
    self.val = Defaulted{};
  }
}