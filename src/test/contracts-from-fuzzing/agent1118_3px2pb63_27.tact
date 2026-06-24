struct SerializeBoundary {
  a: Int as uint1; // single bit unsigned int
  b: Int as int257; // full range signed int
}

contract SerializeEdgeTest {
  data: SerializeBoundary;

  init() {
    self.data = SerializeBoundary{ a: 1, b: 0 };
  }
}