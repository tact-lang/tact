struct MixedOptionalFlat {
  a: Int?;
  b: Bool;
  c: String?;
  d: Bool?;
  e: String;
  f: Int; 
}

contract MOFContract {
  val: MixedOptionalFlat;

  init() {
    self.val = MixedOptionalFlat{
      a: null,
      b: true,
      c: null,
      d: null,
      e: "hello",
      f: 42
    };
  }
}
