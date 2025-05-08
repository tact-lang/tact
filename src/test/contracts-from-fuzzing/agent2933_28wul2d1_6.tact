struct S1 {
    v: Int;
    o: Int?;
    b: Bool;
}

struct S2 {
    s1: S1;
    b2: Bool?;
    i2: Int;
}

struct S3 {
    s2: S2;
    optionalField: S1?;
}

contract DeepOpt {
    data: S3;

    init() {
        self.data = S3{
            s2: S2{
                s1: S1{ v: 10, o: null, b: true },
                b2: false,
                i2: 15,
            },
            optionalField: null,
        };
    }
}