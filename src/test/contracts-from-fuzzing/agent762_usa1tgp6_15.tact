struct MixedSerialization {
  foo: Int as uint8;
  bar: Int;
  baz: Int as int64;
}

contract MixedSerializationFields {
  m: MixedSerialization;

  init() {
    self.m = MixedSerialization{
      foo: 1,
      bar: 2,
      baz: 3
    };
  }
}