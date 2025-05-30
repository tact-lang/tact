struct S1 {
    f: Int?;
}
struct S2 {
    inner: S1;
}
struct S3 {
    nested: S2?;
}

contract OptionalNest {
    s: S3;
    init() {
        self.s = S3{ nested: null };
    }
}