struct InnerOpt {
  x: Int?;
  y: Bool?;
}

struct S {
  inner: InnerOpt?;
}

contract NullableInner {
  s: S;
  init() {
    self.s = S{ inner: null };
  }
}