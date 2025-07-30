struct S {
    a: Int;
}

contract ArrayOfStructs {
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
        self.s1 = S{a: 1};
        self.s2 = S{a: 2};
        self.s3 = S{a: 3};
        self.s4 = S{a: 4};
        self.s5 = S{a: 5};
        self.s6 = S{a: 6};
        self.s7 = S{a: 7};
        self.s8 = S{a: 8};
        self.s9 = S{a: 9};
        self.s10 = S{a: 10};
    }
}