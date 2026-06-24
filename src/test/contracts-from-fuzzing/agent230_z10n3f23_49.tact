struct InnerMost {
    x: Int?;
}

struct Inner2 {
    im: InnerMost?;
}

struct TopMost {
    in2: Inner2?;
}

contract MultiOptLayer {
    top: TopMost;

    init() {
        self.top = TopMost {
            in2: null
        };
    }
}
