struct S1 {
    a: Int;
    b: Bool;
    c: String;
}

struct S2 {
    d: Int;
    e: S1;
}

struct S3 {
    f: S2;
    g: Int;
}

contract ComplexNested {
    s: S3;

    init() {
        self.s = S3{
            f: S2{
                d: 5,
                e: S1{
                    a: 1,
                    b: true,
                    c: "test",
                },
            },
            g: 9,
        };
    }
}