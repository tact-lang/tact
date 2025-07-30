struct S1 {
    a: Int;
    b: String?;
}

struct S2 {
    c: S1;
    d: Bool;
}

struct S3 {
    e: S2;
    f: Slice?;
}

contract MultiLevelOptionals {
    nested: S3;

    init() {
        self.nested = S3{
            e: S2{
                c: S1{ a: 5, b: null },
                d: true
            },
            f: null
        };
    }
}