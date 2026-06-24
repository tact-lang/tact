struct InnerMost {
    x: Int;
}

struct Mid {
    inner: InnerMost?;
}

struct OuterMost {
    mid: Mid?;
}

contract MultiOptNested {
    data: OuterMost;

    init() {
        self.data = OuterMost {
            mid: Mid {
                inner: null
            }
        };
    }
}