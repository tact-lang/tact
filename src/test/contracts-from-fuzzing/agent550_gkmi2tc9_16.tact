struct SerializationFormats {
  v1: Int as coins;
  v2: Int as int16;
  v3: Int as uint3;
  v4: Int as int257;
}

contract Test {
  s: SerializationFormats;
  init() {
    self.s = SerializationFormats{
      v1: ton("1"),
      v2: -123,
      v3: 5,
      v4: 123456789
    };
  }
}