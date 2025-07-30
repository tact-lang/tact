struct S1 {
    f: Int;
}

struct S2 {
    s: S1;
    o1: Int?;
}

struct S3 {
    s: S2;
    o2: Bool?;
    name: String;
}

contract Test {
    nested: S3;

    init() {
        self.nested = S3{
            s: S2{
                s: S1{ f: 33 },
                o1: null,
            },
            o2: null,
            name: "ok",
        };
    }
}