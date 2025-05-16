struct S1 {
    a: Int;
}

struct S2 {
    b: Int;
}

contract TestContract {
    f1: S1;
    f2: Int;
    f3: S2;
    init() {
        self.f1 = S1{ a:1 };
        self.f2 = 5;
        self.f3 = S2{ b:2 };
    }
}