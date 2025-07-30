// Testing contract with a struct using various serializations on optional fields

struct Variant {
  a: Int? as coins;
  b: Int? as uint32;
  c: Int? as int64;
}

contract OptionalSerializationVariant {
  rec: Variant;

  init() {
    self.rec = Variant{ a: null, b: null, c: null };
  }
}
