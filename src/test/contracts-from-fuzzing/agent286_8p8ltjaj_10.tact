struct A {
    valA: Int;
}
struct B {
    valB: Int;
}
struct C {
    valC: Int;
}
struct D {
    valD: Int;
}
struct E {
    valE: Int;
}

struct Deep {
    a: A;
    b: B;
    c: C;
    d: D;
    e: E;
}

contract TestContract {
    deepNest: Deep;

    init() {
        self.deepNest = Deep{
            a: A{valA: 1},
            b: B{valB: 2},
            c: C{valC: 3},
            d: D{valD: 4},
            e: E{valE: 5}
        };
    }
}