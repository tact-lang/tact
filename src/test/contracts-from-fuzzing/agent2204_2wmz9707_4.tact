struct S1 { a: Int; }
struct S2 { a: Int; }
struct S3 { a: Int; }
struct S4 { a: Int; }
struct S5 { a: Int; }
struct S6 { a: Int; }
struct S7 { a: Int; }
struct S8 { a: Int; }
struct S9 { a: Int; }
struct S10 { a: Int; }

contract TenStructFields {
    s1: S1;
    s2: S2;
    s3: S3;
    s4: S4;
    s5: S5;
    s6: S6;
    s7: S7;
    s8: S8;
    s9: S9;
    s10: S10;
    init() {
        self.s1 = S1{ a: 1 };
        self.s2 = S2{ a: 2 };
        self.s3 = S3{ a: 3 };
        self.s4 = S4{ a: 4 };
        self.s5 = S5{ a: 5 };
        self.s6 = S6{ a: 6 };
        self.s7 = S7{ a: 7 };
        self.s8 = S8{ a: 8 };
        self.s9 = S9{ a: 9 };
        self.s10 = S10{ a: 10 };
    }
}