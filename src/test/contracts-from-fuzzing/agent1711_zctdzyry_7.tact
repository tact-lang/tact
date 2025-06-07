struct S1 {
    a: Int?;
}

struct S2 {
    b: S1?;
}

struct S3 {
    c: S2?;
}

contract TestChainOptionals {
    state: S3;

    init() {
        self.state = S3 { c: null };
    }
}