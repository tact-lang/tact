struct OptionalSerialize {
  a: Int? as uint64;
  b: Bool?;
}

contract OptSerial {
  data: OptionalSerialize;
  init() {
    self.data = OptionalSerialize {
      a: null,
      b: true
    };
  }
}
