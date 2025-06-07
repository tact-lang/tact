struct A { x: Int; }
struct B { a: A; y: Int; }
struct C { b: B; z: Int; }

contract StructChain {
    c: C;

    init() {
        self.c = C{ b: B{ a: A{ x: 13 }, y: 14 }, z: 15 };
    }
}