struct S1 {
    foo: Int;
}

struct S2 {
    bar: S1;
}

struct S3 {
    baz: S2;
}

contract MultiDeepStructs {
    s: S3;
    init() {
        self.s = S3{
            baz: S2{
                bar: S1{
                    foo: 999,
                },
            },
        };
    }
}