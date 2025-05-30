struct A { a1: Int; }
struct B { b1: Int; b2: Int?; }
struct C { c1: A; c2: B; c3: Int; }

contract NestedStructs {
    state: C;
    init() {
        self.state = C{
            c1: A{ a1: 10 },
            c2: B{ b1: 20, b2: null },
            c3: 30
        };
    }
}