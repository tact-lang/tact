struct S1 {
    a: Int;
}

struct S2 {
    b: Int;
}

struct S3 {
    c: Int;
}

contract Combo {
    s1: S1;
    s2: S2?;
    s3: S3;

    init() {
        self.s1 = S1{ a:1 };
        self.s2 = null;
        self.s3 = S3{ c:3 };
    }
}