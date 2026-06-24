struct A {
    a1: Int;
}

struct B {
    b1: Int;
}

struct C {
    c1: Int;
}

contract TestContract {
    fa: A;
    fb: B;
    fc: C;

    init() {
        self.fa = A{a1:1};
        self.fb = B{b1:2};
        self.fc = C{c1:3};
    }
}