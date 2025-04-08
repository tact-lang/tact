struct OptionalSerial {
  a: Int?;
  b: String?;
}

contract OptionalSerialization {
  field: OptionalSerial;

  init() {
    self.field = OptionalSerial{ a: null, b: null };
  }
}