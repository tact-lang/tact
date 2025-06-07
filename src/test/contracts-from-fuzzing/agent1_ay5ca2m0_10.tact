struct S1 {
    i: Int;
}

struct S2 {
    s1: S1;
}

struct S3 {
    s2: S2;
}

contract DeepLevels {
    d: S3;

    init() {
        self.d = S3{ s2: S2{ s1: S1{ i: 77 } } };
    }
}
