struct S1 {
    v1: Int;
}

struct S2 {
    s1: S1;
}

struct S3 {
    s2: S2;
}

contract NestedStructDefault {
    data: S3;

    init() {
        self.data = S3{ s2: S2{ s1: S1{ v1: 0 } } };
    }
}