struct S1 {
    innerOpt: Int?;
    txt: String;
}

struct S2 {
    s1a: S1;
    s1b: S1;
}

struct S3 {
    s2: S2;
    addr: Address?;
}

contract TripleNest {
    data: S3;

    init() {
        self.data = S3{
            s2: S2{
                s1a: S1{
                    innerOpt: null,
                    txt: "a",
                },
                s1b: S1{
                    innerOpt: 42,
                    txt: "b",
                },
            },
            addr: null,
        };
    }
}