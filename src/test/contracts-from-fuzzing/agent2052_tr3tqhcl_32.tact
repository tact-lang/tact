contract SerializeSizes {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;

    init() {
      self.a = 200;
      self.b = -12345;
      self.c = 123456789;
    }
}