struct Params {
  a: Int = 1;
  b: Bool = false;
  c: String = "x";
}

contract TestContract {
  state: Params;

  init() {
    self.state = Params{};
  }
}