struct A {
    x: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

contract Deep {
    c: C;

    init() {
        self.c = C{b: B{a: A{x: 123}}};
    }
}