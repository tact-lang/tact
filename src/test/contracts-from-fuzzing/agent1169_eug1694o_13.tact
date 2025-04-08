struct BigNested {
    a: Int;
    b: Bool;
    c: String;
    inner: Inner;
}

struct Inner {
    d: Int?;
    e: String?;
    f: Bool?;
}

contract BigComplex {
    data: BigNested;

    init() {
        self.data = BigNested{
            a: 1, b: true, c: "hi",
            inner: Inner{d: null, e: null, f: null}
        };
    }
}