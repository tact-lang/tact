struct MixDefOpt {
  a: Int? = null;
  b: Bool = true;
  c: String;
}

contract ComboDefaults {
  s: MixDefOpt;

  init() {
    self.s = MixDefOpt{ c: "test" };
  }
}