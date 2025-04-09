struct Defaulted {
  a: Int = 5;
  b: Bool = true;
  c: String = "hello";
}

contract DefaultedStructContract {
  data: Defaulted;

  init() {
    self.data = Defaulted{};
  }
}
