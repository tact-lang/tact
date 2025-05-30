struct OptionalNested {
  inner: Int?;
}

contract AssignNullToOptionalNested {
  data: OptionalNested;

  init() {
    self.data = OptionalNested{
      inner: null
    };
  }
}
