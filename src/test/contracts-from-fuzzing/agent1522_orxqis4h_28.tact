struct NestedInt {
  a: Int as uint16;
}

struct OuterInt {
  inner: NestedInt;
}

contract InnerSerialized {
  d: OuterInt;

  init() {
    self.d = OuterInt{
      inner: NestedInt{ a: 42 },
    };
  }

  receive() {
    let _ = self.d;
  }
}