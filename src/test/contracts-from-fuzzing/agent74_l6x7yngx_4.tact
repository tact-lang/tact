struct A {
    a1: Int;
}

struct B {
    b1: Int;
}

contract TestContract {
    s1: A;
    s2: B;
    n: Int;

    init() {
        self.s1 = A{ a1: 1 };
        self.s2 = B{ b1: 2 };
        self.n = 3;
    }
}