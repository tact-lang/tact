struct A { x: Int as uint16 }
struct B { y: Int as uint24 }

contract MixedSerializedNested {
  field1: A;
  field2: B;

  init() {
    self.field1 = A{ x: 10 };
    self.field2 = B{ y: 20 };
  }
}
