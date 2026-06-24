struct OptionalNest {
  optInt: Int?;
  optBool: Bool?;
  optAddr: Address?;
}

contract OptionalFields {
  data: OptionalNest;

  init() {
    self.data = OptionalNest{
      optInt: null,
      optBool: true,
      optAddr: null
    };
  }
}