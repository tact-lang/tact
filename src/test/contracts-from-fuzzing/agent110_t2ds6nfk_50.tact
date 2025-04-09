struct S0 { f0: Int }
struct S1 { s0: S0 }
struct S2 { s1: S1 }
struct S3 { s2: S2 }
struct S4 { s3: S3 }
struct S5 { s4: S4 }
contract Deep {
    val: S5;
    init() {
        self.val = S5{s4:S4{s3:S3{s2:S2{s1:S1{s0:S0{f0:42}}}}}};
    }
}