struct S {
    a: Int;
    b: Int;
}

contract FieldOrderTest {
    f1: Int;
    f2: S;
    f3: Bool;
    f4: S;

    init() {
        self.f1 = 1;
        self.f2 = S{ a: 2, b:3 };
        self.f3 = true;
        self.f4 = S{ a: 4, b:5 };
    }
}