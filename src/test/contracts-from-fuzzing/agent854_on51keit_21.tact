struct S {
  i: Int;
  optBool: Bool?;
  str: String;
  optStr: String?;
}

contract MixedOptionalNested {
  s: S;

  init() {
    self.s = S{
      i: 1,
      optBool: null,
      str: "hi",
      optStr: null
    };
  }
}