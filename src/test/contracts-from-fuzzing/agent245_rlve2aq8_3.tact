struct OptInner {
    x: Int;
}

struct OuterOpt {
    optInner: OptInner?;
}

contract OptionalNestedTest {
    s: OuterOpt;

    init() {
        self.s = OuterOpt{ optInner: null };
    }
}