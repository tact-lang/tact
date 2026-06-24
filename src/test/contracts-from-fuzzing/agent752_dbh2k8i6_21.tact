struct NestedEmptyOpt {
  a: Int?; b: Bool?; c: String?;
}

struct HasOptStruct {
  ne: NestedEmptyOpt?;
}

contract OptStructField {
  field: HasOptStruct;
  init() {
    self.field = HasOptStruct{ ne: null };
  }
}