struct A { a: Int }
struct B { b: Int }
struct C { c: Int }

struct D {
    d1: A;
    d2: B;
    d3: C;
}

contract MultiNest {
    data: D;

    init() {
        self.data = D{
            d1: A{a: 1},
            d2: B{b: 2},
            d3: C{c: 3}
        };
    }
}
