struct NullableNested {
  innerOpt: Inner?;
}

struct Inner {
  n: Int?;
  flag: Bool;
}

contract NullableField {
  data: NullableNested;

  init() {
    self.data = NullableNested{ innerOpt: null };
  }
}