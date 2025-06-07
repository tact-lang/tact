struct A {
    iv: Int;
}

struct B {
    av: A;
}

struct C {
    bv: B;
}

contract TestContract {
    c: C;

    init() {
        self.c = C{ bv: B{ av: A{ iv: 999 } } };
    }
}