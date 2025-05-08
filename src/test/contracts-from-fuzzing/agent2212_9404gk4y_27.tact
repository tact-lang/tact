struct S1 {
    a: Int;
}

struct S2 {
    s1: S1?;
}

struct S3 {
    s2: S2;
}

struct S4 {
    s3: S3;
}

contract Test {
    chain: S4;

    init() {
        self.chain = S4{s3: S3{s2: S2{s1: null}}};
    }
}
