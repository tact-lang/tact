struct S1 {
    v1: Int;
}

struct S2 {
    v2: S1;
}

struct S3 {
    v3: S2;
}

contract ThreeNest {
    f: S3;

    init() {
        self.f = S3{ v3: S2{ v2: S1{ v1: 7 } } };
    }
}