struct BigNest {
    a: Int;
    b: Bool;
    c: Inner;
    d: Int?;
}

struct Inner {
    foo: Bool;
}

contract BigNestTest {
    s: BigNest;

    init() {
        self.s = BigNest{
            a: 1,
            b: true,
            c: Inner{foo:false},
            d: null,
        };
    }
}
