struct S1 {
    a: Int;
}

struct S2 {
    a: Int;
}

contract SameFieldNameNested {
    f1: S1;
    f2: S2;

    init() {
        self.f1 = S1{ a:1 };
        self.f2 = S2{ a:2 };
    }
}
