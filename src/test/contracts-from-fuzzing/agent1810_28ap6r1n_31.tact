struct OuterMost {
  i: Int;
  b: Bool;
  s: String;
  optionalInt: Int?;
  optionalBool: Bool?;
  optionalStr: String?;
}

struct MiddleN {
  nested: OuterMost;
  extra: Int;
}

struct OuterShell {
  m: MiddleN;
}

contract SuperNestedComplex {
  out: OuterShell;
  init() {
    self.out = OuterShell{
      m: MiddleN{
        nested: OuterMost{
          i: 42, b: true, s: "hi",
          optionalInt: null, optionalBool: null, optionalStr: null
        },
        extra: 99
      }
    };
  }
}