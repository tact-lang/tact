struct A {
    a: Int;
}

struct B {
    a: Int;
}

contract SameFieldsDiffStructs {
    s1: A;
    s2: B;

    init() {
        self.s1 = A{ a:1 };
        self.s2 = B{ a:2 };
    }
}