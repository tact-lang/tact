struct A {
    v: Int;
}

struct B {
    w: Int;
}

contract ManyStructs {
    s1: A;
    s2: B;

    init() {
        self.s1 = A{v:1};
        self.s2 = B{w:2};
    }
}