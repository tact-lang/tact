struct Complex {
  a: Int?;
  b: Bool?;
  c: Cell?;
}

contract OptionalsTest {
  data: Complex;
  init() {
    self.data = Complex{ a: null, b: true, c: null };
  }
}