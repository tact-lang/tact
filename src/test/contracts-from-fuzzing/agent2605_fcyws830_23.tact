contract ChainOptionalStructs {
    a: S1?;

    init() {
        self.a = null;
    }
}

struct S1 {
    b: S2?;
}

struct S2 {
    c: S3?;
}

struct S3 {
    x: Int;
}
