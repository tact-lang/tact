struct OptionalNest {
  bar: String?;
  num: Int?;
}

contract OptionalFields {
  info: OptionalNest;

  init() {
    self.info = OptionalNest{
      bar: null,
      num: null,
    };
  }
}
