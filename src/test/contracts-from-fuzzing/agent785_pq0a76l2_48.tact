// Test nested serialization annotations via structs within structs
struct Child {
  a: Int as uint8;
}
struct Parent {
  b: Int as int16;
  c: Child;
}
contract SerialNested {
  data: Parent;
  init() {
    self.data = Parent{ b: -1000, c: Child{ a: 100 } };
  }
}
