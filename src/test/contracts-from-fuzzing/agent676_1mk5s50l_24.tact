struct A {
    va: Int;
}

struct B {
    vb: Int;
}

struct C {
    vc: Int;
}

contract ManyNestedLevels {
    a: A;
    b: B;
    c: C;

    init() {
        self.a = A{va: 1};
        self.b = B{vb: 2};
        self.c = C{vc: 3};
    }
}