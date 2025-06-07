struct WithOptionals {
  id: Int?;
  flag: Bool?;
}

contract OptionalStructField {
  f: WithOptionals;

  init() {
    self.f = WithOptionals{
      id: null,
      flag: null,
    };
  }
}