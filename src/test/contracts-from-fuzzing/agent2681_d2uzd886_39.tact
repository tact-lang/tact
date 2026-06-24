struct A { x: Int; }
struct B { a: A; }
struct C { b: B; }

contract OptChain {
    c: C?;
    init() { self.c = null; }
}