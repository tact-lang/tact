struct InnerMost {
    a: Int;
    b: Bool;
}

struct Mid {
    inner: InnerMost;
}

struct Outer {
    first: Mid;
    second: Mid;
}

contract MultiNest {
    data: Outer;

    init() {
        self.data = Outer{
            first: Mid{inner: InnerMost{a: 1, b: true}},
            second: Mid{inner: InnerMost{a: 2, b: false}}
        };
    }
}
