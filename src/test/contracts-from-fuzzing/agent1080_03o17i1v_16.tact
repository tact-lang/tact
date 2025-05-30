struct OptionalStruct {
  a: Int?;
}

struct Wrapper {
  s: OptionalStruct;
}

contract OptInOpt {
  data: Wrapper;

  init() {
    self.data = Wrapper{
      s: OptionalStruct{ a: null },
    };
  }
}