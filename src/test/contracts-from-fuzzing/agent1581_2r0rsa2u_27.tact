struct MixOpt {
  a: Int;
  b: Bool?;
  c: String;
  d: Int?;
  e: String?;
}

contract ComboHolder {
  inner: MixOpt;

  init() {
    self.inner = MixOpt{
      a: 42,
      b: null,
      c: "hi",
      d: null,
      e: null,
    };
  }
}