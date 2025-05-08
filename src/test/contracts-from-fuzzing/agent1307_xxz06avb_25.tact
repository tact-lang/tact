contract Basic {
    foo: Int as uint32 = 0;
    bar: Int as int64 = -1;

    init() {
      self.foo = 100;
      self.bar = -64;
    }
}