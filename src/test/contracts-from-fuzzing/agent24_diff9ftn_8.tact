struct A {
    x: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

struct D {
    c: C;
}

contract Cascade {
    cascade: D;

    init() {
        self.cascade = D{ c: C{ b: B{ a: A{ x: 7 } } } };
    }
}