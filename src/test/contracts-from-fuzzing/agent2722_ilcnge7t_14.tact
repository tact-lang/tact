struct InnerMost {
    x: Int;
}

struct Inner {
    innermost: InnerMost;
}

struct Middle {
    inner: Inner;
}

struct Wrapper {
    middle: Middle;
}

contract WrappedDeeply {
    data: Wrapper;

    init() {
        self.data = Wrapper {
            middle: Middle {
                inner: Inner {
                    innermost: InnerMost { x: 10 }
                }
            }
        };
    }
}