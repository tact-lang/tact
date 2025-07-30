struct S1 {
    x: Int;
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

contract VeryDeepStorage {
    root: S4;

    init() {
        self.root = S4{ s3: S3{ s2: S2{ s1: S1{ x: 99 } } } };
    }
}