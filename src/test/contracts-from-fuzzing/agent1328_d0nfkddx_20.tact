struct A {
    v: Int;
}

struct B {
    v: Int;
}

struct Big {
    a: A;
    b: B;
    c: A;
    d: B;
    e: A;
    f: B;
}

contract Combo {
    big: Big;
    init() {
        self.big = Big{
            a: A{v:1},
            b: B{v:2},
            c: A{v:3},
            d: B{v:4},
            e: A{v:5},
            f: B{v:6},
        };
    }
}