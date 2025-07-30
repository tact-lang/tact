struct S1 {
    a: Int;
}

struct S2 {
    b: S1;
}

struct S3 {
    c: S2;
}

contract UltraDeep {
    val: S3;

    init() {
        self.val = S3{ c: S2{ b: S1{ a: 42 } } };
    }
}