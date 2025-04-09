struct WithSerialization {
  a: Int as uint8;
  b: Int as int16;
  c: Int as coins;
}

contract SerializedFields {
  data: WithSerialization;

  init() {
    self.data = WithSerialization{ a: 7, b: 1000, c: 1_000_000 };
  }
}
