struct S1 {
    x: Int;
}

struct S2 {
    i: S1;
}

struct S3 {
    i: S2;
}

contract EmbedHierarchy {
    s: S3;
    init() {
        self.s = S3{ i: S2{ i: S1{ x: 123 } } };
    }
}