struct Tiny {
  flag: Bool?;
  count: Int?;
  small: Int?;
}

struct WrapTiny {
  nested: Tiny?;
}

contract TestOptionalPrimitives {
  store: WrapTiny;

  init() {
    self.store = WrapTiny {
      nested: null
    };
  }
}