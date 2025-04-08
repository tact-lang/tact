struct ComposeThese {
    a: Int;
    s: SInner;
}

struct SInner {
    value: Int as uint32;
    note: String?;
}

contract Combined {
    composed: ComposeThese;
    init() {
        self.composed = ComposeThese{
            a: 99,
            s: SInner{value:123,note:"hi"}
        };
    }
}