struct A { a1: Int = 1; a2: Int = 2; }

struct B1 {
  b1: Int = 42;
  nest: A = A{};
}

contract TestOrder1 {
  data: B1 = B1{};
}