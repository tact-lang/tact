struct A { valA: Int; }
struct B { valB: Int; }
struct C {
    a: A;
    b: B;
}

struct D {
    c: C;
    optC: C?;
}

contract OptionalDeep {
    d: D?;

    init() {
        self.d = null;
    }
}