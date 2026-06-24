struct ManyDefaults {
  a: Int = 1;
  b: Bool = true;
  c: String = "x";
  d: Int?;
  e: Bool?;
}

contract Test {
  val: ManyDefaults;

  init() {
    self.val = ManyDefaults{
      d: null,
      e: null
    };
  }
}