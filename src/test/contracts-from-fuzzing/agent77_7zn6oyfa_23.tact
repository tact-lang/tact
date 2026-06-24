// Nested structs, deep, with optionals, exercising serialization paths
struct A { a: Int; }
struct B { b: A?; }
struct C { c: B; }
struct D { d: C?; }

contract SerialNest {
  v : D;
  init() {
    self.v = D { d: null };
  }
}