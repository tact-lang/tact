struct S1 { a: Int }
struct S2 { s1: S1 }
struct S3 { s2: S2 }
struct S4 { s3: S3 }
struct S5 { s4: S4 }
struct S6 { s5: S5 }

contract Test {
    s6: S6;
    init() {
        self.s6 = S6{s5: S5{s4: S4{s3: S3{s2: S2{s1: S1{a: 42}}}}}};
    }
}