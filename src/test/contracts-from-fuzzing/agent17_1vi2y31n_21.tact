struct OptAndNested {
  optInt: Int?;
  nest: InnerStruct;
}
struct InnerStruct {
  val: String?;
}

contract Combined {
  f: OptAndNested;

  init() {
    self.f = OptAndNested{ optInt: null, nest: InnerStruct{ val: null } };
  }
}