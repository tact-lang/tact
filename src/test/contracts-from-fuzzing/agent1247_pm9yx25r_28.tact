contract MixedSerialization {
  a: Int as int32 = 10;
  b: Int as uint8 = 250;
  c: Int as int257 = -123456;

  init() {}
}