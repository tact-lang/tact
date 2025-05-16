struct S1 {
    a: Int;
    b: String;
}

struct S2 {
    c: Int;
    d: S1;
}

struct S3 {
    e: Bool;
    f: S2;
}

contract DeepNest {
    nested: S3;

    init() {
        self.nested = S3{
            e: true,
            f: S2{
                c: 42,
                d: S1{
                    a: 7,
                    b: "deep"
                }
            }
        };
    }
}