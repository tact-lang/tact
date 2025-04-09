struct A {
    aa: Int;
}

struct B {
    bb: Int;
}

struct C {
    cc: Int;
}

contract TestContract {
    f1: Int;
    f2: Bool;
    sa: A;
    sb: B;
    sc: C;

    init() {
        self.f1 = 1;
        self.f2 = true;
        self.sa = A{ aa: 10 };
        self.sb = B{ bb: 20 };
        self.sc = C{ cc: 30 };
    }
}