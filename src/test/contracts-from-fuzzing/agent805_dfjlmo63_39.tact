struct NestedSerialize {
  a: Int as uint32;
  b: InnerSer;
}

struct InnerSer {
  x: Int as int64;
  y: Bool;
}

contract NestedSerialization {
  d: NestedSerialize;

  init() {
    self.d = NestedSerialize{ a: 42, b: InnerSer{ x: -5, y: true } };
  }
}
