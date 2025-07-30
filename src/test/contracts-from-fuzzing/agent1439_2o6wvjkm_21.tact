struct S3 {
    a: Int;
    b: Int;
}

struct S2 {
    s3: S3;
    n: Int;
}

struct S1 {
    s2: S2;
    val: Int;
}

contract Deep3Nested {
    f: S1;
    init() {
        self.f = S1{ s2: S2{ s3: S3{a:1,b:2}, n:3 }, val:4 };
    }
}