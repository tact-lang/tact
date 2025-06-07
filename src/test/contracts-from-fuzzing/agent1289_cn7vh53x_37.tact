// test complex nested optional with serialization formats
struct Inner {
  x: Int? as uint16;
  y: Address?;
}

contract NestedOptSerde {
  rec: Inner?;

  init() {
    self.rec = null;
  }
}
