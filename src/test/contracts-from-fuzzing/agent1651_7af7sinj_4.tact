struct DeepOptional {
  level1: Int?;
  level2: String?;
  level3: Bool?;
}

contract OptionalFields {
  opt: DeepOptional;

  init() {
    self.opt = DeepOptional{
      level1: null,
      level2: null,
      level3: true,
    };
  }
}