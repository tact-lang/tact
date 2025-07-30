struct S1 {
    n: Int;
    b: Bool;
}

struct S2 {
    nested1: S1;
    nested2: S1;
}

struct S3 {
    nestedS2: S2;
    strVal: String;
}

contract RepeatedNested {
    s3: S3;

    init() {
        self.s3 = S3{
            nestedS2: S2{
                nested1: S1{ n: 1, b: true },
                nested2: S1{ n: 2, b: false },
            },
            strVal: "hi",
        };
    }
}
