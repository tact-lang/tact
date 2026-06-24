struct A { x: Int; }
struct B { a: A?; }
struct C { b: B?; }
struct D { c: C?; }
struct E { d: D?; }

contract TestContract(
    nested: E?
) {}