struct A {
  a: Int;
}

struct B {
  b: A;
}

struct CStr {
  c: B;
}

struct D {
  d: CStr;
}

contract Test {
  val: D = D{ d: CStr{ c: B{ b: A{ a: 42 } } } };
}
