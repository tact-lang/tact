struct S1 {
    x: Int;
    y: String?;
}

struct S2 {
    a: Int?;
    b: S1;
}

struct S3 {
    s: S2?;
}

contract OptionalDeepNesting {
    store: S3;

    init() {
        self.store = S3{
            s: null
        };
    }
}
