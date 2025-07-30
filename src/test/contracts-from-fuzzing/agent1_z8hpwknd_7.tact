struct A { a: Int; }
struct B { b: Int; }
struct C { c: Int; }
struct D { d: Int; }
struct E { e: Int; }

contract ManyNestedStructs {
    sa: A;
    sb: B;
    sc: C;
    sd: D;
    se: E;

    init() {
        self.sa = A{ a: 1 };
        self.sb = B{ b: 2 };
        self.sc = C{ c: 3 };
        self.sd = D{ d: 4 };
        self.se = E{ e: 5 };
    }
}