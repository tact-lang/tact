struct InnerMost {
    a: Int;
}

struct Inner {
    i: InnerMost;
}

struct Mid {
    inner: Inner;
}

struct Top {
    middle: Mid;
}

contract MultiLayer {
    storage: Top;

    init() {
        self.storage = Top{
            middle: Mid{
                inner: Inner{
                    i: InnerMost{
                        a: 1
                    }
                }
            }
        };
    }
}