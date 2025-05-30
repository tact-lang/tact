struct S1 {
    f: Int?;
}

struct S2 {
    f: Int?;
    s1: S1;
}

struct S3 {
    s2: S2;
    f: Int?;
}

struct S4 {
    s3: S3;
    f: Int?;
}

contract MultiNested {
    data: S4;

    init() {
        self.data = S4{
            s3: S3{
                s2: S2{
                    f: null,
                    s1: S1{f: null}
                },
                f: null
            },
            f: null
        };
    }
}