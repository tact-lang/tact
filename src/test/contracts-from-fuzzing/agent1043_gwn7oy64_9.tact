struct WithBoolAndOptional {
  f1: Bool;
  f2: Int?;
  f3: Bool?;
  f4: String?;
}

contract TestContract {
  field: WithBoolAndOptional;
  init() {
    self.field = WithBoolAndOptional{
      f1: false, f2: 42, f3: null, f4: null
    };
  }
}