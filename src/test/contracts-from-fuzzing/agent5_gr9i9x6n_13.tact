struct InnerMost {
  tiny: Int as uint8;
}

struct NestedBig {
  inner: InnerMost;
  bigger: Int as int64;
}

contract IntSerializationTest {
  sample: NestedBig;

  init() {
    self.sample = NestedBig{
      inner: InnerMost{ tiny: 255 },
      bigger: -1234567890
    };
  }

  receive() {
    let _ = self.sample.inner.tiny;
  }
}
