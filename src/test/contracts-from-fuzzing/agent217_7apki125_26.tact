struct Defaults {
  a: Int = 1;
  b: Bool = true;
  c: String = "t";
  d: Int?;
  e: Bool?;
}

contract NestedDefaults {
  data: Defaults;

  init() {
    self.data = Defaults{
      d: null,
      e: null
    };
  }
}