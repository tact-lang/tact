struct InnerMost { a: Int; }

struct Middle1 { im: InnerMost; }

struct Middle2 { im: InnerMost; }

struct Top {
    m1: Middle1;
    m2: Middle2;
}

contract DoubleNest {
    state: Top;

    init() {
        self.state = Top {
            m1: Middle1 { im: InnerMost { a: 1 } },
            m2: Middle2 { im: InnerMost { a: 2 } }
        };
    }
}