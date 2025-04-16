struct A { x: Int; }
struct B { y: Int; }
struct C { a: A; b: B; }

contract CrossNest {
    c: C;

    init() {
        self.c = C{
            a: A{ x: 11 },
            b: B{ y: 22 },
        };
    }
}