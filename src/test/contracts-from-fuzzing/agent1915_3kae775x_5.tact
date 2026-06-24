struct S1 {
    num: Int;
}

struct S2 {
    nested1: S1;
}

struct S3 {
    nested2: S2;
}

struct S4 {
    nested3: S3;
}

contract ManyNestedStorage {
    f: S4;

    init() {
        self.f = S4{ nested3: S3{ nested2: S2{ nested1: S1{ num: 101 } } } };
    }
}