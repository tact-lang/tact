struct S {
    x: Int;
}

contract BigArrayLike {
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
        self.s1 = S{ x:1 };
        self.s2 = S{ x:2 };
        self.s3 = S{ x:3 };
        self.s4 = S{ x:4 };
        self.s5 = S{ x:5 };
        self.s6 = S{ x:6 };
        self.s7 = S{ x:7 };
        self.s8 = S{ x:8 };
        self.s9 = S{ x:9 };
        self.s10 = S{ x:10 };
    }
}