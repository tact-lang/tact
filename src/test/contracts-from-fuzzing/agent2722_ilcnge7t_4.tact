struct NestedOptionalInner {
    val: Int;
}

struct NestedOptionalOuter {
    innerOpt: NestedOptionalInner?;
    flag: Bool;
}

contract OptionalStructs {
    state: NestedOptionalOuter;

    init() {
        self.state = NestedOptionalOuter {
            innerOpt: null,
            flag: true,
        };
    }
}