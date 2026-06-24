struct S1 {
    a: Int;
    b: String;
}

struct S2 {
    c: Bool;
    d: Int?;
    e: S1;
}

struct S3 {
    f: S2;
    g: Bool?;
}

contract TripleNest {
    x: S3;

    init() {
        self.x = S3{
            f: S2{
                c: false,
                d: 5,
                e: S1{
                    a: 42,
                    b: "hello"
                }
            },
            g: null
        };
    }
}