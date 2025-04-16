struct A {
  x: Int;
}

struct B {
  a: A;
  y: Int;
}

struct C {
  b: B;
  z: Bool;
}

contract FieldsOrderTest {
  field1: Int = 1;
  field2: A = A{ x: 2 };
  field3: B = B{ a: A{ x:3 }, y:4 };
  field4: C = C{ b: B{ a:A{ x:5 }, y:6 }, z:true };
}