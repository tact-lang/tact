struct OptNested {
  first: Int?;
  second: Bool?;
  third: String?;
}

contract NullableNested {
  data: OptNested;

  init() {
    self.data = OptNested{
      first: null,
      second: null,
      third: null
    };
  }
}