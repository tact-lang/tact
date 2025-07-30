struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    s1: S1;
    c: String;
}

struct S3 {
    s2: S2;
    d: Int;
}

contract MultiNest {
    data: S3;

    init() {
        self.data = S3{
            s2: S2{
                s1: S1{
                    a: 1,
                    b: true,
                },
                c: "hi",
            },
            d: 42,
        };
    }
}