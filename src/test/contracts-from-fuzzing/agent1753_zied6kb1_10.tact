struct S1 {
    x1: Int;
}

struct S2 {
    x2: String;
    s1: S1;
}

struct S3 {
    x3: Bool;
    s2: S2;
}

struct S4 {
    s3: S3;
    s1: S1;
}

contract CrossNested {
    data: S4;

    init() {
        self.data = S4{
            s3: S3{
                x3: true,
                s2: S2{
                    x2: "ok",
                    s1: S1{x1: 100}
                }
            },
            s1: S1{x1: 55}
        };
    }
}