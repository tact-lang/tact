struct A {
    b: B;
}

struct B {
    c: C;
}

struct C {
    d: D;
}

struct D {
    e: Int;
    f: Int?;
}

contract ChainNested {
    val: A;

    init() {
        self.val = A{ b: B{ c: C{ d: D{ e: 123, f: null } } } };
    }
}