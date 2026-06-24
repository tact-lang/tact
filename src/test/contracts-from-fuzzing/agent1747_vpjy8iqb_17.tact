struct S1 {
    x: Int;
}

struct S2 {
    a: S1;
    b: Int;
}

struct S3 {
    s: S2;
    f: Bool;
}

contract NestedDeepFields {
    s3: S3;

    init() {
        self.s3 = S3{
            s: S2{ a: S1{ x: 5 }, b: 6 },
            f: false
        };
    }
}