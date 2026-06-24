struct OptionalStruct {
  innerOpt: InnerStruct?;
}

struct InnerStruct {
  v: Int;
  flag: Bool;
}

contract OptStructTest {
  data: OptionalStruct;

  init() {
    self.data = OptionalStruct{ innerOpt: null };
  }
}