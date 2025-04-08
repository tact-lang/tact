struct InnerMost { x: Int }
struct Middle {
    inner: InnerMost?;
}

struct Outer {
    middle: Middle?;
}

contract ChainOpt {
    s: Outer;

    init() {
        self.s = Outer{ middle: null };
    }
}