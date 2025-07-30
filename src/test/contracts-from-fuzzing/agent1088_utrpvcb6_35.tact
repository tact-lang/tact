struct OptionalStructs {
  a: Int?;
  b: Bool?;
  c: Address?;
  d: Cell?;
  e: Slice?;
  f: String?;
}

struct Wrap {
  inner: OptionalStructs?;
}

contract OptionalWrap {
  storage: Wrap;

  init() {
    self.storage = Wrap{inner: null};
  }
}