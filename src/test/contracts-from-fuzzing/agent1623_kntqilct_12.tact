struct S1 {
    a: Int;
    b: Int?;
}

struct S2 {
    s1: S1;
    c: Bool?;
}

struct S3 {
    s2: S2;
    d: Address?;
}

struct S4 {
    s3: S3;
    e: Cell?;
}

contract DeepOptionals {
    nested: S4;
    init() {
        self.nested = S4{
            s3: S3{
                s2: S2{
                    s1: S1{a:1, b:null},
                    c: true,
                },
                d: null,
            },
            e: emptyCell(),
        };
    }
}