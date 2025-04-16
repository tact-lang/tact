struct S1 {
    f1: Int;
}

struct S2 {
    s1: S1;
}

struct S3 {
    s2: S2;
}

contract DeepChainTest {
    nested: S3;

    init() {
        self.nested = S3{ s2: S2{ s1: S1{ f1: 42 } } };
    }
}