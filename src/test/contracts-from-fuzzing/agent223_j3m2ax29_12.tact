struct S1 {
    a: Int;
}

struct S2 {
    b: Int?;
}

struct S3 {
    s1: S1;
    s2: S2?;
}

contract MixedDeepOptional {
    s3: S3;

    init() {
        self.s3 = S3{
            s1: S1{a: 11},
            s2: null
        };
    }
}