struct OptOptStruct {
  a: Int?;
  b: Bool?;
}

struct MiddleOpt {
  inner: OptOptStruct?;
}

contract OptOptContract {
  field: MiddleOpt;

  init() {
    self.field = MiddleOpt{ inner: null };
  }
}