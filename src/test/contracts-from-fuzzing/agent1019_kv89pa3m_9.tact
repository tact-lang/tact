struct Inner {
  x: Int;
  y: Int?;
}

struct WrapOption {
  nested: Inner?;
}

contract OptionalStructField {
  data: WrapOption;

  init() {
    self.data = WrapOption{ nested: Inner{ x: 1, y: null } };
  }
}
