// Compose with nested struct, optional struct, and optional inner fields
struct S {
  a: Int?;
  b: Bool;
  s: String?;
}
struct T {
  inner: S?;
  flag: Bool;
}

contract NestedOptionalComplex {
  data: T;
  init() {
    self.data = T{
      inner: S{ a: null, b: true, s: null },
      flag: false,
    };
  }
}