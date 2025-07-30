struct S1 {
    val1: Int;
}

struct S2 {
    s1: S1;
}

struct S3 {
    s2: S2;
}

contract VeryDeepStorage {
    nested: S3;

    init() {
        self.nested = S3{ s2: S2{ s1: S1{ val1: 123 } } };
    }
}
