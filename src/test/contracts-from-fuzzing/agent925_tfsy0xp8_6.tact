struct S1 {
    a: Int;
}

struct S2 {
    b: S1;
}

struct S3 {
    c: S2;
}

contract StructChain {
    chain: S3;

    init() {
        self.chain = S3{ c: S2{ b: S1{ a: 42 } } };
    }
}