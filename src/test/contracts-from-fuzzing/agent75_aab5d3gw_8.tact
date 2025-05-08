struct NestedOpt {
  a: Int?;
  b: String?;
  c: Bool?;
}

struct Wrapper {
  nested: NestedOpt;
}

contract Test {
  w: Wrapper;

  init() {
    self.w = Wrapper{ nested: NestedOpt{ a: null, b: null, c: null } };
  }
}