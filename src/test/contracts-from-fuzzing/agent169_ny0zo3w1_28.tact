struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    s1: S1?;
    str: String;
}

struct S3 {
    s2: S2?;
    value: Int;
}

contract TestContract {
    s3: S3;

    init() {
        self.s3 = S3{ s2: null, value: 0 };
    }
}