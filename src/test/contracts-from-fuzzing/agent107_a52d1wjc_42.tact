struct S1 {
    a: Int?;
}

struct S2 {
    inner: S1?;
}

struct S3 {
    inner: S2?;
}

contract OptionalChain {
    nested: S3?;

    init() {
        self.nested = null;
    }
}