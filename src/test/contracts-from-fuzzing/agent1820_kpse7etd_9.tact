contract NestedStructs {
    s1: S1;
    init() {
        self.s1 = S1{
            s2: S2{
                s3: S3{
                    value: 999,
                },
            },
        };
    }
}

struct S1 {
    s2: S2;
}

struct S2 {
    s3: S3;
}

struct S3 {
    value: Int;
}