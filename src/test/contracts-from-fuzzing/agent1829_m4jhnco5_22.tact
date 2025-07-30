struct A { a: Int; }
struct B { b: Int; }
struct C { c: Int; }
struct D { d: Int; }

struct Big {
    a: A;
    b: B;
    c: C;
    d: D;
}

contract TestContract {
    big: Big;

    init() {
        self.big = Big{
            a: A{a:1},
            b: B{b:2},
            c: C{c:3},
            d: D{d:4}
        };
    }
}