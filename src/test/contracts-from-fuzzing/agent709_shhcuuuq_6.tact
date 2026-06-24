struct C {
  z: Int = 3;
}

struct B {
  y: C = C{};
}

struct A {
  x: B = B{};
}

contract TestContract {
  nested: A = A{};
}