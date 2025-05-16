struct A {
    a: Int;
}

struct B {
    b: Int;
}

struct C {
    c: Int;
}

contract ManyFields {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
    f6: A;
    f7: B;
    f8: C;

    init() {
        self.f1 = 1;
        self.f2 = 2;
        self.f3 = 3;
        self.f4 = 4;
        self.f5 = 5;
        self.f6 = A{ a: 6 };
        self.f7 = B{ b: 7 };
        self.f8 = C{ c: 8 };
    }
}