struct LargeComposite {
  a: Int;
  b: Bool;
  c: Address;
  d: String;
  e: Int?;
  f: Bool?;
  g: Address?;
  h: String?;
}

contract TestContract {
  composite: LargeComposite;

  init() {
    self.composite = LargeComposite{
      a: 1,
      b: true,
      c: myAddress(),
      d: "hello",
      e: null,
      f: null,
      g: null,
      h: null,
    };
  }
}
