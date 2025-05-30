struct OptionalDeep {
  opt: InnerStruct?;
}

struct InnerStruct {
  value: String?;
}

contract OptDeepTest {
  field: OptionalDeep;

  init() {
    self.field = OptionalDeep{
      opt: InnerStruct{
        value: null
      }
    };
  }
}