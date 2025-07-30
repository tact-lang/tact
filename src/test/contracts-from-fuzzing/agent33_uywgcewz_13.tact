struct InnerMost {
    v: Int;
}

struct Inner {
    im: InnerMost;
}

struct Outer {
    inr: Inner;
}

contract DeepStruct {
    state: Outer;

    init() {
        self.state = Outer {
            inr: Inner {
                im: InnerMost {
                    v: 99
                }
            }
        };
    }
}