struct S1 {
    a: Int;
    b: String;
}

struct S2 {
    s: S1;
    c: Bool;
}

struct S3 {
    t: S2;
    d: String;
}

contract MultiLevelStructs {
    v: S3;

    init() {
        self.v = S3{
            t: S2{
                s: S1{ a: 2, b: "x" },
                c: false
            },
            d: "done"
        };
    }
}
