struct S1 {
    a: Int?;
    b: Bool?;
}

struct S2 {
    s1: S1?;
}

struct S3 {
    s2: S2?;
}

contract DeepOptionals {
    stuff: S3;

    init() {
        self.stuff = S3{
            s2: S2{
                s1: S1{
                    a: 256,
                    b: true,
                },
            },
        };
    }
}