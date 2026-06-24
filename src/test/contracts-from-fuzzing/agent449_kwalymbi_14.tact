struct S1 {
    i: Int;
}

struct S2 {
    flag: Bool;
    inner: S1;
}

struct S3 {
    s2: S2;
    str: String;
    maybeInner: S1?;
}

contract TestContract {
    s3field: S3;

    init() {
        self.s3field = S3{
            s2: S2{
                flag: false,
                inner: S1{i: 99},
            },
            str: "fuzz",
            maybeInner: null,
        };
    }
}
