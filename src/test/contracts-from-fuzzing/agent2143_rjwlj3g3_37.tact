struct NestedSerialization {
  a: Int as uint8;
  b: InnerSerialization;
}

struct InnerSerialization {
  x: Int as uint4;
  y: Int as int8;
}

contract NestedSerializationContract {
  data: NestedSerialization;

  init() {
    self.data = NestedSerialization{
      a: 42,
      b: InnerSerialization{x: 7, y: -8}
    };
  }
}