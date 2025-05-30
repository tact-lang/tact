struct A { 
    a: Int;
}

struct B {
    b: A;
}

struct C {
    c: B;
}

struct D {
    d: C;
}

struct E {
    e: D;
}

contract Chain {
    chain: E;

    init() {
        self.chain = E{ e: D{ d: C{ c: B{ b: A{ a: 23 } } } } };
    }
}