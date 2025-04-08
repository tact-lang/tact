struct S {
    a: Int;
    b: Bool;
    c: String;
}

contract ArrayLike {
    s0: S;
    s1: S;
    s2: S;
    s3: S;
    s4: S;
    s5: S;
    s6: S;
    s7: S;
    s8: S;
    s9: S;

    init() {
        self.s0 = S{a: 0, b: false, c: "0"};
        self.s1 = S{a: 1, b: true, c: "1"};
        self.s2 = S{a: 2, b: false, c: "2"};
        self.s3 = S{a: 3, b: true, c: "3"};
        self.s4 = S{a: 4, b: false, c: "4"};
        self.s5 = S{a: 5, b: true, c: "5"};
        self.s6 = S{a: 6, b: false, c: "6"};
        self.s7 = S{a: 7, b: true, c: "7"};
        self.s8 = S{a: 8, b: false, c: "8"};
        self.s9 = S{a: 9, b: true, c: "9"};
    }
}