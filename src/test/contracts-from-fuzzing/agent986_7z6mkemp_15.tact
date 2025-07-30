struct S1 {
    a: Int;
}

struct S2 {
    s: S1;
}

struct S3 {
    t: S2;
}

contract DeepChain {
    d: S3;

    init() {
        self.d = S3{ t: S2{ s: S1{ a: 3 } } };
    }
}
