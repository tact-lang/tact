struct S {
    a: Int = 1;
    b: Int = 2;
}

contract WithManyFields {
    s1: S;
    s2: S;
    s3: S;
    s4: S;
    s5: S;
    s6: S;
    s7: S;
    s8: S;
    s9: S;
    s10: S;

    init() {
        self.s1 = S{};
        self.s2 = S{};
        self.s3 = S{};
        self.s4 = S{};
        self.s5 = S{};
        self.s6 = S{};
        self.s7 = S{};
        self.s8 = S{};
        self.s9 = S{};
        self.s10 = S{};
    }
}