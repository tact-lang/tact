struct OptionalNested {
  a: Int?;
  b: Bool?;
  c: Address?;
}

contract OptStructPartialInit {
  data: OptionalNested;

  init() {
    self.data = OptionalNested{ a: 7 };
  }
}
