struct NestedOptionalInner {
    value: Int;
}

struct NestedOptionalOuter {
    data: NestedOptionalInner?;
}

contract OptInOpt {
    storage: NestedOptionalOuter?;

    init() {
        self.storage = null;
    }
}