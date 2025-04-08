struct NestedOptional {
  inner: Int?;
  flag: Bool;
}

contract OptionalNested {
  value: NestedOptional;

  init() {
    self.value = NestedOptional{
      inner: null,
      flag: true
    };
  }
}