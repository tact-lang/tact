struct S {
    a: Int = 1;
}

contract ManyFields {
    f0: Int = 0;
    f1: Int = 1;
    f2: Int = 2;
    f3: Int = 3;
    f4: Int = 4;
    f5: Int = 5;
    f6: Int = 6;
    f7: Int = 7;
    f8: Int = 8;
    f9: Int = 9;
    f10: Int = 10;
    f11: Int = 11;
    f12: Int = 12;
    f13: Int = 13;
    f14: Int = 14;
    f15: Int = 15;
    nested1: S = S{};
    nested2: S = S{};
    nested3: S = S{};
    nested4: S = S{};
    nested5: S = S{};
    nested6: S = S{};
    nested7: S = S{};
    nested8: S = S{};
    nested9: S = S{};
    nested10: S = S{};

    init() {
        self.f0 = 0;
        self.f15 = 15;
        self.nested10 = S{a: 123};
    }
}