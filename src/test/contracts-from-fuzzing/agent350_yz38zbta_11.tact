struct InnerMost {
    v: Int;
}

struct MiddleOpt {
    maybe: InnerMost?;
}

struct OuterNestOpt {
    middle: MiddleOpt?;
}

contract OptNestTest {
    state: OuterNestOpt;

    init() {
        self.state = OuterNestOpt{ middle: null };
    }
}
