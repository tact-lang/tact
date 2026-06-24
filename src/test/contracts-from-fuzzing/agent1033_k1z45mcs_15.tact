struct A {
    i: Int;
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

contract PersistDeep {
    val: D;

    init() {
        self.val = D{ c: C{ b: B{ a: A{ i: 12345 } } } };
    }
}