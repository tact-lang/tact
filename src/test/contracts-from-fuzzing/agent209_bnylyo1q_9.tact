struct Defaulted {
  x: Int = 5;
  y: Bool = true;
}

contract TestContract {
  data: Defaulted;

  init() {
    self.data = Defaulted{};
  }
}