struct S1 {
    n: Int;
}

struct S2 {
    s: S1;
}

struct S3 {
    s: S2;
}

contract DeepNested {
    data: S3;

    init() {
        self.data = S3{ s: S2{ s: S1{ n: 123 } } };
    }
}