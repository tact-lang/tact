struct S1 {
    a: Int;
}

struct S2 {
    b: Int;
    s1: S1;
}

struct S3 {
    c: Int;
    s2: S2;
}

contract TestContract {
    s3: S3;

    init() {
        self.s3 = S3 {
            c: 99,
            s2: S2 {
                b: 88,
                s1: S1 { a: 77 }
            }
        };
    }
}