// Struct field with both optional Int? and optional String?
struct MixedOpts {
  i: Int?;
  s: String?;
  b: Bool?;
}

contract OptsMix {
  val: MixedOpts;

  init() {
    self.val = MixedOpts{
      i: null,
      s: null,
      b: true
    };
  }
}
