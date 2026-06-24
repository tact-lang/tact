struct S1 {
    a: Int = 1;
}

struct S2 {
    b: S1;
}

struct S3 {
    c: S2;
}

struct S4 {
    d: S3;
}

contract Test {
    deeply: S4;
    init() {
        self.deeply = S4{ d: S3{ c: S2{ b: S1{ a: 1 } } } };
    }
}