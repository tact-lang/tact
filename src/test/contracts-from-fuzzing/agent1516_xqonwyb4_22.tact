struct WithManyDefaults {
  a: Int = 1;
  b: Bool = false;
  c: String = "hi";
  d: Int?;
  e: Bool?;
  f: String?;
}

contract InitDefaults {
  s: WithManyDefaults;

  init() {
    self.s = WithManyDefaults{
      d: null,
      e: true,
      f: null
    };
  }
}