struct MixOptDefaults {
  a: Int = 5;
  b: Bool?;
  c: String?;
}

contract OptDefaults {
  val: MixOptDefaults;

  init() {
    self.val = MixOptDefaults{
      b: null,
      c: null
    };
  }
}
