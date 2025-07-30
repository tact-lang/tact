struct OptionalOuter {
    nested: OptionalInner?;
}

struct OptionalInner {
    num: Int;
    flag: Bool;
    addr: Address?;
}

contract NullOuterInit {
    s: OptionalOuter;

    init() {
        self.s = OptionalOuter{
            nested: null,
        };
    }
}