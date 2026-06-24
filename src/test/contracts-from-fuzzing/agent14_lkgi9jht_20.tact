struct S1 {
    a: Int;
}

struct S2 {
    s1: S1;
    b: Bool;
}

struct S3 {
    s2: S2;
    c: Int?;
}

contract TestContract {
    s3: S3;

    init() {
        self.s3 = S3{
            s2: S2{
                s1: S1{ a: 77 },
                b: false,
            },
            c: null,
        };
    }
}