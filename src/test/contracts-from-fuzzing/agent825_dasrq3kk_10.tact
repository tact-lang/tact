struct S1 {
    a: Int;
}

struct S2 {
    b: Bool;
    s1: S1;
}

struct S3 {
    s2: S2;
    s1: S1;
}

contract Test {
    s3: S3;

    init() {
        self.s3 = S3{
            s2: S2{
                b: true,
                s1: S1{a: 7}
            },
            s1: S1{a: 9}
        };
    }
}