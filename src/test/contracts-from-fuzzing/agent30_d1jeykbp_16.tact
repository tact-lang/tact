struct S1 { x: Int; }
struct S2 { s1: S1; }
struct S3 { s2: S2; }
struct S4 { s3: S3; }
struct S5 { s4: S4; }
struct S6 { s5: S5; }
struct S7 { s6: S6; }
struct S8 { s7: S7; }
struct S9 { s8: S8; }
struct S10 { s9: S9; }

contract TestDeepChainExtra {
    receive() {
        // Build the deeply nested chain starting from S1 with x = 42
        let s1: S1 = S1{ x: 42 };
        let s2: S2 = S2{ s1: s1 };
        let s3: S3 = S3{ s2: s2 };
        let s4: S4 = S4{ s3: s3 };
        let s5: S5 = S5{ s4: s4 };
        let s6: S6 = S6{ s5: s5 };
        let s7: S7 = S7{ s6: s6 };
        let s8: S8 = S8{ s7: s7 };
        let s9: S9 = S9{ s8: s8 };
        let s10: S10 = S10{ s9: s9 };
        // Access the deeply nested field
        s10.s9.s8.s7.s6.s5.s4.s3.s2.s1.x;
    }
}
