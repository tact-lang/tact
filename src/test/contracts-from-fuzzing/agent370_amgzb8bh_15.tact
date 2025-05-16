struct AllOptional {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract AllOptionalsTest {
  d: AllOptional;

  init() {
    self.d = AllOptional{ a: null, b: null, c: null };
  }
}