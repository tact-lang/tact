struct S1 {
    x: Int;
    next: S2;
}

struct S2 {
    y: Int;
    next: S3;
}

struct S3 {
    z: Int;
    flag: Bool;
}

contract ChainTest {
    chain: S1;

    init() {
        self.chain = S1{ x: 11, next: S2{ y: 22, next: S3{ z: 33, flag: true } } };
    }
}