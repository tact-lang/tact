struct S1 {
    x: Int;
}

struct S2 {
    y: S1;
}

struct S3 {
    z: S2;
}

contract StructFieldOrdering {
    f1: Int;
    f2: S1;
    f3: S2;
    f4: S3;

    init() {
        self.f1 = 1;
        self.f2 = S1{ x:2 };
        self.f3 = S2{ y: S1{ x:3 } };
        self.f4 = S3{ z: S2{ y: S1{ x:4 } } };
    }
}