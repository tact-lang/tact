struct S1 {
    x: Int;
}

struct S2 {
    s: S1;
}

struct S3 {
    s: S2;
}

struct S4 {
    s: S3;
}

contract Test6 {
    deep: S4;

    init() {
        self.deep = S4{ s: S3{ s: S2{ s: S1{ x: 42 } } } };
    }
}
