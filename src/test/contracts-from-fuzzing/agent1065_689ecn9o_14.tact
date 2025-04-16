struct S1 {
    f1: Int;
}

struct S2 {
    s1: S1;
}

struct S3 {
    s2: S2;
}

contract Level3Nested {
    d: S3;
    init() {
        self.d = S3{ s2: S2{ s1: S1{ f1: 42 } } };
    }
}