struct InnerMost {
    x: Int;
}

struct InnerMid {
    im: InnerMost;
}

struct Inner {
    mid: InnerMid;
}

contract DeepLayered {
    val: Inner;

    init() {
        self.val = Inner {
            mid: InnerMid {
                im: InnerMost {
                    x: 1234
                }
            }
        };
    }
}
