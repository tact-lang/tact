struct Defaulted {
  v1: Int = 10;
  v2: Bool = true;
  v3: String = "hi";
}

contract DefaultStructTest {
  s: Defaulted;

  init() {
    self.s = Defaulted{};
  }
}
