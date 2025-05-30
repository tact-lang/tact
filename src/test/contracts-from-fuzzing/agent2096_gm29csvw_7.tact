struct S1 {
    val: Int;
}

struct S2 {
    s: S1;
}

struct S3 {
    s: S2;
}

contract RecursiveDepth {
    f: S3;

    init() {
        self.f = S3{ s: S2{ s: S1{ val: 123 } } };
    }
}