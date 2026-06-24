struct InnerMost {
    val: Int;
    msg: String;
}

struct Mid {
    inner: InnerMost;
    flag: Bool;
}

struct Top {
    mid: Mid;
    x: Int;
}

contract NestedPlain {
    store: Top;

    init() {
        self.store = Top{
            mid: Mid{
                inner: InnerMost{
                    val: 55,
                    msg: "deep"
                },
                flag: true
            },
            x: 42
        };
    }

    receive() {
        dump(self.store.mid.inner.val);
    }
}