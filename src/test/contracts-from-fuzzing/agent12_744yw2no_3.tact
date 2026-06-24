struct OptionalNested {
  optVal: Int?;
  flag: Bool?;
}

contract TestOptional {
  state: OptionalNested;

  init() {
    self.state = OptionalNested{
      optVal: null,
      flag: true
    };
  }
}
