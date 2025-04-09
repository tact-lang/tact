struct S1 { a: Int }
struct S2 { s1: S1 }
struct S3 { s2: S2 }
struct S4 { s3: S3 }

contract WideDeep {
    f1: S4;
    f2: S4;
    f3: S4;

    init() {
        self.f1 = S4{ s3:S3{ s2:S2{ s1:S1{a:1}}}};
        self.f2 = S4{ s3:S3{ s2:S2{ s1:S1{a:2}}}};
        self.f3 = S4{ s3:S3{ s2:S2{ s1:S1{a:3}}}};
    }
}