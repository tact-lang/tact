struct SimpleNested {
    flag: Bool;
}

struct OptionalOuter {
    innerOpt: SimpleNested?;
}

contract OptionalNestedStruct {
    s: OptionalOuter;
    init() {
        self.s = OptionalOuter{ innerOpt: null };
    }
}