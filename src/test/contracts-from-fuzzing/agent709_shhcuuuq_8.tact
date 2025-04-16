struct C {
  z: Int;
}

struct B {
  y: C? = null;
}

struct A {
  x: B = B{};
}

contract TestContract {
  nested: A = A{};
}