// Large nested struct tree
struct S1 { a: Int = 1; }
struct S2 { s1: S1 = S1{}; }
struct S3 { s2: S2 = S2{}; }
struct S4 { s3: S3 = S3{}; }
struct S5 { s4: S4 = S4{}; }
struct S6 { s5: S5 = S5{}; }
struct S7 { s6: S6 = S6{}; }
struct S8 { s7: S7 = S7{}; }
struct S9 { s8: S8 = S8{}; }
struct S10 { s9: S9 = S9{}; }

contract BigNest {
    data: S10 = S10{};

    receive() {
        self.data = S10{};
    }
}