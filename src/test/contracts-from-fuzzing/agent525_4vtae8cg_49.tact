// Attempt optional serialization format
contract OptSerialized {
  foo: Int? as uint64;
  bar: Int? as int64;

  init() {
    self.foo = 1234567890;
    self.bar = -1234567890;
  }
}