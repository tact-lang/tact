struct A {
    f: Int;
}

struct B {
    s: A;
}

struct C {
    t: B;
}

struct D {
    u: C;
}

struct E {
    v: D;
}

contract ChainABCD {
    link: E;

    init() {
        self.link = E { v:D { u:C { t:B { s:A { f:42 } } } } };
    }
}