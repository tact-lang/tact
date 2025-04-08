struct PackedPrimitives {
  a: Int as int8;
  b: Int as uint8;
  c: Int as int16;
  d: Int as uint16;
  e: Int as int32;
  f: Int as uint32;
}

contract PrimitivesPacked {
  packed: PackedPrimitives;

  init() {
    self.packed = PackedPrimitives{
      a: -5,
      b: 250,
      c: -30000,
      d: 65000,
      e: -1000000,
      f: 3000000
    };
  }
}