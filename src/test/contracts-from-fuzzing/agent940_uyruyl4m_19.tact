struct S {
  u: Int as uint8;
  i: Int as int16;
  c: Int as coins;
}

contract SerializationFormats {
  s: S;

  init() {
    self.s = S{ u: 255, i: -32768, c: ton("1") };
  }
}
