struct D { v: Int? = null; }
struct C { d: D = D{}; }
struct B { c: C = C{}; }
struct A { b: B = B{}; }
contract X {
  a: A = A{};
}