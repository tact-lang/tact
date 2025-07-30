struct S1 { a: Int }
struct S2 { s1: S1 }
struct S3 { s2: S2 }
struct S4 { s3: S3 }
struct S5 { s4: S4 }
struct S6 { s5: S5 }
struct S7 { s6: S6 }
struct S8 { s7: S7 }
struct S9 { s8: S8 }
struct S10 { s9: S9 }

contract DeepChain {
    data: S10;

    init() {
        let s1 = S1{ a: 42 };
        let s2 = S2{ s1 };
        let s3 = S3{ s2 };
        let s4 = S4{ s3 };
        let s5 = S5{ s4 };
        let s6 = S6{ s5 };
        let s7 = S7{ s6 };
        let s8 = S8{ s7 };
        let s9 = S9{ s8 };
        self.data = S10{ s9 };
    }
}