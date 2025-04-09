struct A {
    num: Int;
}

struct B {
    f: A;
}

struct C {
    g: B;
}

struct D {
    h: C;
}

contract ChainStructs {
    nested: D;

    init() {
        self.nested = D{ h: C{ g: B{ f: A{ num: 99 } } } };
    }
}