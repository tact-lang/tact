struct Optionals {
  oi: Int?;
  ob: Bool?;
  os: String?;
}

contract OptionalFields {
  data: Optionals;

  init() {
    self.data = Optionals{
      oi: null,
      ob: null,
      os: null
    };
  }
}