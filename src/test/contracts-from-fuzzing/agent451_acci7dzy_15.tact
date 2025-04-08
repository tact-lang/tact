struct A {
    b: B;
    c: C;
}

struct B {
    d: Int;
}

struct C {
    e: Bool;
}

contract MultiNested {
    f: A;

    init() {
        self.f = A{ b: B{ d: 1 }, c: C{ e: false } };
    }
}