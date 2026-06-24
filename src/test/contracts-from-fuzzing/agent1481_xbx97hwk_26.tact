// Test serialization overriding
struct SerStruct {
  a: Int as uint7;
  b: Int as int15;
  c: Int;
}

contract SerStructTest {
  s: SerStruct;
  init() {
    self.s = SerStruct{ a:100, b:-1000, c:42 };
  }
}