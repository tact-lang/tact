struct A { a: Int }
struct B { b: Int }
struct C { c: Int }

struct BigNest {
    a: A;
    b: B;
    c: C;
}

contract GroupEmbedded {
    data: BigNest;
    init() {
        self.data = BigNest{
            a: A{a:1},
            b: B{b:2},
            c: C{c:3},
        };
    }
}