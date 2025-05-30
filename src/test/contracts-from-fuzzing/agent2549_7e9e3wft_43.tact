struct NestedStringOpt {
  s: String?;
}

struct Wrap {
  inner: NestedStringOpt?;
}

contract NullableNestedString {
  v: Wrap;

  init() {
    self.v = Wrap{ inner: NestedStringOpt{ s:null } };
  }
}