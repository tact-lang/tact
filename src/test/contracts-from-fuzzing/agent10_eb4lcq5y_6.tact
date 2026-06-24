struct OptionalInner {
    s: String?;
}

struct OptionalOuter {
    nested: OptionalInner?;
}

contract OptNested {
    val: OptionalOuter;
    init() {
        self.val = OptionalOuter{ nested: OptionalInner{ s: null } };
    }
    receive() {}
}