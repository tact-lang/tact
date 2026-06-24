struct SerializeTest {
  a: Int as uint8;
  b: Int as int64;
  c: Int as uint4;
}

contract SerializeEdgeCases {
  data: SerializeTest;

  init() {
    self.data = SerializeTest{ a: 255, b: -42, c: 15 };
  }
}
