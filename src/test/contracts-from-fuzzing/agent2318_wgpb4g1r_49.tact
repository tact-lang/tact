struct OptionalWithSerialized {
  a: Int? as uint32;
  b: Int? as int64;
}

contract TestContract {
  data: OptionalWithSerialized = OptionalWithSerialized{
    a:null, b:null
  };

  init() {
    self.data = OptionalWithSerialized{
      a:999,
      b:-12345678
    };
  }
}
