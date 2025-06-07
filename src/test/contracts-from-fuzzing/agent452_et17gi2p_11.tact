struct OptDeep {
  f1: Int?;
  f2: Bool?;
  f3: String?;
}

contract DeepInside {
  field: OptDeep;

  init() {
    self.field = OptDeep{
      f1: null,
      f2: null,
      f3: null,
    };
  }
}