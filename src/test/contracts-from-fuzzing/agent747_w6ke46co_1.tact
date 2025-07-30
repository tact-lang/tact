contract TestContract {
    emptyNested: OuterNested;

    init() {
        self.emptyNested = OuterNested{
            mid: Middle{
                inner: Inner{
                    value: 42
                }
            }
        };
    }
}

struct OuterNested {
    mid: Middle;
}

struct Middle {
    inner: Inner;
}

struct Inner {
    value: Int;
}
