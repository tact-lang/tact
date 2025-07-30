struct OptionalDeep {
    inner: S4?;
}

struct S1 { a: Int; }
struct S2 { b: S1; }
struct S3 { c: S2; }
struct S4 { d: S3; }

contract Test {
    s: OptionalDeep;

    init() {
        self.s = OptionalDeep{
            inner: null
        };
    }
}