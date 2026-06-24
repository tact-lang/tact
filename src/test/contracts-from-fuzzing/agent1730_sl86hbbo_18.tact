struct ComplexOptions {
  optA: Bool?;
  optB: Int?;
  optC: Cell?;
  optD: Slice?;
  optE: Address?;
  optF: String?;
}

contract ComplexOptionTest {
  data: ComplexOptions?;

  init() {
    self.data = null;
  }
}