struct OptionStruct {
  maybeInt: Int?;
  maybeStr: String?;
}

struct NestedOptStruct {
  opt: OptionStruct?;
}

contract OptInOpt {
  field: NestedOptStruct;

  init() {
    self.field = NestedOptStruct{ opt: OptionStruct{ maybeInt: null, maybeStr: null } };
  }
}