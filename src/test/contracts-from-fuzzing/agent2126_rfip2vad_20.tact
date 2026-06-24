struct Mid {
    inner: Inner;
}

struct Inner {
    a: Int;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract TestContract {
    m: Mid;

    init() {
        self.m = Mid{
            inner: Inner{
                a: 123,
                b: null,
                c: null,
                d: null,
            },
        };
    }
}
