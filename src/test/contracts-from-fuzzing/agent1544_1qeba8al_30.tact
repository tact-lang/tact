struct TestOrder {
  a: Int as uint8;
  b: Int as int64;
  c: Int as uint16;
  d: Int;
}

contract SerializationOrder {
  val: TestOrder;

  init() {
    self.val = TestOrder{ a:1,b:2,c:3,d:4 };
  }
}
