struct MixedDefaults {
  a: Int;             // required
  b: Bool = true;     // has default
  c: String = "hi";  // has default
}

contract PartialDefaults {
  data: MixedDefaults;
  init() {
    self.data = MixedDefaults{
      a: 123
    };
  }
}