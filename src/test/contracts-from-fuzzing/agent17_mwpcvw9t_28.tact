struct A {
  a: Int?;
}

struct B {
  a: A?;
}

struct C {
  b: B?;
}

contract DeepNulls {
  val: C = C{b: null};
}