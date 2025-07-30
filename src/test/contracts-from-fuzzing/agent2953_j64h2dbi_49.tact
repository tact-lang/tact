// Persistent fields using explicit serialization for compactness
contract ExplicitSerdeFields {
  a: Int as int8 = -12;
  b: Int as uint8 = 255;
  c: Int as uint16 = 65535;
  d: Int as uint32 = 0xFFFFFFFF;
}