struct S1 {
    i: Int;
}

struct S2 {
    b: Bool;
    inner: S1;
}

struct S3 {
    s: String;
    nested: S2;
    opt: Int?;
}

contract MultiNest {
    val: S3;

    init() {
        self.val = S3{
            s: "x",
            nested: S2{
                b: true,
                inner: S1{ i: 99 }
            },
            opt: null
        };
    }
}