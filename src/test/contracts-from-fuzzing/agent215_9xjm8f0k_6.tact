struct A {
 x: Int;
 y: Bool;
}

struct B {
 a: A;
 z: String;
}

struct C {
 b: B;
 u: Bool;
}

contract OptionalNested {
  data: C? = null;
}