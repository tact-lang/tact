struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    c: S1;
}

struct S3 {
    d: S2;
}

contract TestContract {
    nested: S3?;
    init() {
        self.nested = S3{ d: S2{ c: S1{ a: 1, b: false } } };
    }
}