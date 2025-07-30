struct OverSized {
  x: Int as uint4;
}

contract IntOverflowTest {
  data: OverSized;
  init() {
    self.data = OverSized{ x: 20 }; // outside 0..15
  }
}
