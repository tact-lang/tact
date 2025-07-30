struct HasOptionals {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract OptionalVars {
  data: HasOptionals;

  init() {
    self.data = HasOptionals{};
  }
}
