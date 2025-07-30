struct S1 {
    a: Int;
    b: Int;
}

struct S2 {
    s: S1;
    x: Bool;
}

struct S3 {
    s: S2;
    comment: String;
}

contract ChainNested {
    field: S3;

    init() {
        self.field = S3{
            s: S2{
                s: S1{a:1, b:2},
                x: true
            },
            comment: "test"
        };
    }
}