struct S1 {
    flag: Bool;
}

struct S2 {
    s1: S1;
}

struct S3 {
    s2: S2;
}

struct S4 {
    s3: S3;
}

contract FourNest {
    s4: S4;

    init() {
        self.s4 = S4{ s3: S3{ s2: S2{ s1: S1{flag: true}}}};
    }
}