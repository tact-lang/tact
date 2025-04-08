struct MixedOpts {
  i: Int?;
  b: Bool?;
  a: Address?;
  s: String?;
  c: Cell?;
  sl: Slice?;
}

contract OptMixedStorage {
  mixed: MixedOpts;

  init() {
    self.mixed = MixedOpts{
      i: 5,
      b: null,
      a: null,
      s: "ok",
      c: null,
      sl: null,
    };
  }
}
