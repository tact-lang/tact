struct AllOpt {
  a: Int?;
  b: Bool?;
  c: Address?;
  s: String?;
}

contract AllOptInitNull {
  data: AllOpt;

  init() {
    self.data = AllOpt{};
  }
}
