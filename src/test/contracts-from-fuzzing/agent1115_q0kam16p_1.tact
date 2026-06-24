struct OptionalNested {
  count: Int?;
  enabled: Bool?;
}

contract TestContract {
  nestedOpt: OptionalNested;

  init() {
    self.nestedOpt = OptionalNested{
      count: null,
      enabled: true
    };
  }
}