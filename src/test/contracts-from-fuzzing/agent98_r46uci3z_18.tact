struct S1 {
    a: Int;
}

struct S2 {
    s1: S1;
    b: Int;
}

struct S3 {
    s2: S2;
    c: Int;
}

struct S4 {
    s3: S3;
    d: Int;
}

contract DeepChain {
    deep: S4;
    init() {
        self.deep = S4{
            s3: S3{
                s2: S2{
                    s1: S1{
                        a: 1,
                    },
                    b: 2,
                },
                c: 3,
            },
            d: 4,
        };
    }
}