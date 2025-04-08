struct BYTES {
  b1: Int as uint8;
  b2: Int as uint16;
  b3: Int as uint32;
  b4: Int as uint64;
}

contract BytesContract {
  store: BYTES;

  init() {
    self.store = BYTES{
      b1: 255,
      b2: 65535,
      b3: 4294967295,
      b4: 18446744073709551615
    };
  }
}