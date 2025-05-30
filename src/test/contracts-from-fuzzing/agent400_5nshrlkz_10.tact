struct OptNested {
  i: Int?;
  s: String?;
  a: Address?;
  c: Cell?;
  sl: Slice?;
  b: Bool?;
}

contract TestOptNestWide {
  data: OptNested;

  init() {
    self.data = OptNested {
      i: null, s: null, a: null, c: null, sl: null, b: null
    };
  }

  receive() {
    if (self.data.i != null) {
      let _ = self.data.i!!;
    }
  }
}