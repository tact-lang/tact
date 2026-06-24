struct S {
  a: Int;
  b: Int?;
  c: String;
  d: String?;
  e: Bool;
  f: Bool?;
}

contract TestContract {
  data: S;

  init() {
    self.data = S {
      a: 1,
      b: null,
      c: "c",
      d: null,
      e: true,
      f: null,
    };
  }
}