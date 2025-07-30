struct S {
    a: Int = 1;
    b: Int = 2;
}

contract LargeTuple {
    f1: S;
    f2: S;
    f3: S;
    f4: S;
    f5: S;
    f6: S;
    f7: S;
    f8: S;
    f9: S;

    init() {
        self.f1 = S{};
        self.f2 = S{};
        self.f3 = S{};
        self.f4 = S{};
        self.f5 = S{};
        self.f6 = S{};
        self.f7 = S{};
        self.f8 = S{};
        self.f9 = S{};
    }
}