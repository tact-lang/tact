contract Test22 {
    a: Int;
    b: Int as int64;
    c: Int as uint64;
    d: Int as int8;
    e: Int as uint8;
    f: Int as int16;
    g: Int as uint16;

    init() {
      self.a = 1;
      self.b = -2;
      self.c = 3;
      self.d = -4;
      self.e = 5;
      self.f = -6;
      self.g = 7;
    }
}
