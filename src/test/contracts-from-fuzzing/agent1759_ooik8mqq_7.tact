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

contract DeepChain {
    x: D;

    init() {
        self.x = D{ dd: C{ cc: B{ bb: A{ aa: 42 } } } };
    }
}
