struct S1 {
    a: Int;
}

struct S2 {
    a: Int;
    s1: S1;
}

struct S3 {
    b: Bool?;
    s2: S2;
}

contract Chain {
    s3: S3;

    init() {
        self.s3 = S3{
            b: false,
            s2: S2{
                a: 8,
                s1: S1{a: 100}
            }
        };
    }
}