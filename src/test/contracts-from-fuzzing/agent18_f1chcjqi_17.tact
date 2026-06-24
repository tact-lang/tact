struct InnerMost {
    z: Int;
    w: String?;
}

struct Middle {
    inner: InnerMost;
}

struct Outer {
    mid: Middle;
}

contract MultiLayer {
    stuff: Outer;
    init() {
        self.stuff = Outer {
            mid: Middle {
                inner: InnerMost {
                    z: 99,
                    w: null
                }
            }
        };
    }
}