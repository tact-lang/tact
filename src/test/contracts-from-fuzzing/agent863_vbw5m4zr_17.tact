struct S1 { a: Int; }

struct S2 { b: S1; }

struct S3 { c: S2; }

contract OptionalDeep {
    inner: S3?;

    init() {
        self.inner = null;
    }
}