struct A { x: Int; }
struct B { y: Int; a: A; }
struct C { z: Int; b: B; }

contract OptionalMidNested {
    c: C?;
    init() { self.c = null; }
}