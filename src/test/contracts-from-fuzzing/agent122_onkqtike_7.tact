struct S1 {
    x: Int;
}

struct S2 {
    inner: S1;
}

struct S3 {
    inner: S2;
}

contract Combine {
    a: S1;
    b: S2;
    c: S3;

    init() {
        self.a = S1{ x:1 };
        self.b = S2{ inner: self.a };
        self.c = S3{ inner: self.b };
    }
}
