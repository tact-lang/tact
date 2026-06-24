struct S1 {
    a: Int;
}

struct S2 {
    s1: S1;
}

struct S3 {
    s2: S2;
}

contract Test4 {
    nested: S3;

    init() {
        self.nested = S3{ s2: S2{ s1: S1{ a: 99 } } };
    }
}
