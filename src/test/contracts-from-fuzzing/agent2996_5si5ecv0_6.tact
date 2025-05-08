struct S1 {
    a: Int;
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

contract DeepChain {
    data: S4;

    init() {
        self.data = S4{ d: S3{ c: S2{ b: S1{ a: 42 } } } };
    }
}