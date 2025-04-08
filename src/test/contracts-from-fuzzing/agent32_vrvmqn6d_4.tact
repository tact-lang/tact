struct MixedOptional {
  a: Int;
  b: String?;
  c: Bool;
  d: Int?;
}

contract Test {
  val: MixedOptional;
  init() {
    self.val = MixedOptional{a: 1, b: null, c: true, d: null};
  }
}