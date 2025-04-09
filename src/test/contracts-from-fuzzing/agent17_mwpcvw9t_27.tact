struct A {
  val: Int;
}

struct B {
  inner1: A;
  inner2: A;
}

contract SimilarStructs {
  b: B = B{inner1: A{val: 1}, inner2: A{val: 2}};
}