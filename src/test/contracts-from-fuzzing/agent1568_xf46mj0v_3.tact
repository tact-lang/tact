struct OptWrapper {
  num: Int?;
  flag: Bool?;
  str: String?;
}

contract OptContract {
  optField: OptWrapper;

  init() {
    self.optField = OptWrapper{
      num: null,
      flag: true,
      str: null,
    };
  }
}