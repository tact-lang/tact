struct A {
  x: Int;
}

struct B {
  y: Int;
}

contract MixedStructs {
  one: A = A{ x: 7 };
  two: B = B{ y: 8 };
  three: A = A{ x: 9 };
  four: B = B{ y: 10 };
}