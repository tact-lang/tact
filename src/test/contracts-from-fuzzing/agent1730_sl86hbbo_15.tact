struct SerializeMix {
  a: Int as uint8;
  b: Int as int16;
  c: Int as uint4;
  d: Int as uint64;
}

contract MixedTypesNested {
  field: SerializeMix;

  init() {
    self.field = SerializeMix{
      a:0, b:0, c:0, d:0
    };
  }
}