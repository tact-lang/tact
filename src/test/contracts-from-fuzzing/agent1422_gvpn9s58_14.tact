struct A {
    a1: Int; a2: Int; a3: Int;
}

struct B {
    b1: Int; b2: Int;
}

struct C {
    c1: Int;
}

contract ManyStructs {
    sa: A;
    sb: B;
    sc: C;
    init() {
        self.sa = A{ a1:1,a2:2,a3:3 };
        self.sb = B{ b1:4,b2:5 };
        self.sc = C{ c1:6 };
    }
}