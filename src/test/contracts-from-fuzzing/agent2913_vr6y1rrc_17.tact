struct Inner {
    a: Int;
}

struct Mid {
    inner: Inner;
}

struct Outer {
    mid: Mid;
}

contract IntermediateNesting {
    store: Outer;

    init() {
        self.store = Outer{
            mid: Mid{
                inner: Inner{
                    a: 123,
                },
            },
        };
    }
}