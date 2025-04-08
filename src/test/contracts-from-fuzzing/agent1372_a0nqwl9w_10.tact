struct S1 {
    a: Int;
}

struct S2 {
    b: Bool;
}

struct S3 {
    c: String;
}

struct ManyNested {
    s1: S1;
    s2: S2;
    s3: S3;
    d: Int;
    e: String;
}

contract TestContract {
    data: ManyNested;
    init() {
        self.data = ManyNested{
            s1: S1{a: 1},
            s2: S2{b: false},
            s3: S3{c: "abc"},
            d: 42,
            e: "xyz",
        };
    }
}