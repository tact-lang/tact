struct A { x: Int; }
struct B { a: A; y: Int; }
struct C { b: B; z: Int; }

contract NestedChain(
    c: C,
) {}