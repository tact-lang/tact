struct S1 {
    x: Int;
    y: Bool;
}

struct S2 {
    inner: S1;
    flag: Bool;
}

struct S3 {
    inner: S2;
    number: Int;
}

contract MultiNestedStorage {
    s3: S3;

    init() {
        self.s3 = S3{
            inner: S2{
                inner: S1{
                    x: 1,
                    y: true,
                },
                flag: false,
            },
            number: 42,
        };
    }
}