struct OptNested {
  inner: Int?;
  other: Bool;
}

contract OptionalStruct {
  data: OptNested;

  init() {
    self.data = OptNested{
      inner: null,
      other: true,
    };
  }
}