struct NegOverSigned {
  x: Int as int4;
}

contract SignedOverflowTest {
  data: NegOverSigned;
  init() {
    self.data = NegOverSigned{ x: -10 }; // outside -8..7
  }
}
