struct A {
    aa: Int;
}

struct B {
    bb: A;
}

struct C {
    cc: B;
}

struct D {
    dd: C;
}

struct E {
    ee: D;
}

contract ChainNested {
    chain: E;

    init() {
        self.chain = E{ ee: D{ dd: C{ cc: B{ bb: A{ aa: 1 }}}}};
    }
}
