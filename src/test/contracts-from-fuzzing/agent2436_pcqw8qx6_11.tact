struct OptionalFieldList {
  f1: Int?;
  f2: Bool?;
  f3: String?;
}

contract OptFields {
  optData: OptionalFieldList;

  init() {
    self.optData = OptionalFieldList{f1: null, f2: null, f3: null};
  }
}