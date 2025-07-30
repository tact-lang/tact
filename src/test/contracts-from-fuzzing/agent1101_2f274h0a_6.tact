struct S1 {
    a: Int;
}

struct S2 {
    b: S1;
}

struct S3 {
    c: S2;
}

contract LongChain {
    st: S3;

    init() {
        self.st = S3{ c: S2{ b: S1{ a: 10 } } };
    }
}