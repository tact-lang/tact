struct S1 {
    n: Int;
}

struct S2 {
    nested: S1;
}

struct S3 {
    nested: S2;
}

struct S4 {
    nested: S3;
}

contract DeepFour {
    data: S4;
    init() {
        self.data = S4{ nested: S3{ nested: S2{ nested: S1{ n: 123 } } } };
    }
}