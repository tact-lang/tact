struct S1 {
    f1: Int;
}

struct S2 {
    s1: S1;
}

struct S3 {
    s2: S2;
}

struct S4 {
    s3: S3;
}

contract Test {
    nested: S4;

    init() {
        self.nested = S4{ s3: S3{ s2: S2{ s1: S1{ f1: 42 } } } };
    }
}