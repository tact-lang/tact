struct OptionalStruct {
  n: Int?;
  s: String?;
  f: Bool?;
}

contract TestContract {
  data: OptionalStruct;

  init() {
    self.data = OptionalStruct{
      n: null,
      s: null,
      f: null,
    };
  }
}
