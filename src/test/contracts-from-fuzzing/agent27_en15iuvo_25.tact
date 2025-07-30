struct A {
    f1: Int;
}

struct B {
    f2: Int;
}

contract OptMix {
    s1: A?;
    s2: B?;

    init() {
        self.s1 = A{f1:42};
        self.s2 = null;
    }
}