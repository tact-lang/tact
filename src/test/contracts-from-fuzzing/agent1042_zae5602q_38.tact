struct A {
  x: Int;
}

struct B {
  y: Int;
  nested: A;
}

contract TwoStructs {
  f1: A = A{x:1};
  f2: B = B{y:2, nested: A{x:3}};
}
