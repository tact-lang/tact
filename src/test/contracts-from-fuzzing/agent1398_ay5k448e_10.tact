struct A {
    a: Int;
}

struct B {
    b: Int;
}

struct C {
    c: Int;
}

contract ManyDifferent {
    sa: A;
    sb: B;
    sc: C;

    init() {
        self.sa = A{ a: 1 };
        self.sb = B{ b: 2 };
        self.sc = C{ c: 3 };
    }
}