struct A {
    v: Int;
}

struct B {
    v: Int;
}

struct C {
    a: A;
    b: B;
}

contract DoubleNested {
    c: C;

    init() {
        self.c = C{a: A{v:1}, b: B{v:2}};
    }
}