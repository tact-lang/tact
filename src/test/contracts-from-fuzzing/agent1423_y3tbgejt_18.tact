struct NestedOptional {
    opt: Int?;
    val: Int;
}

contract OptionalOrdering {
    s: NestedOptional;
    init() {
        self.s = NestedOptional{ opt: null, val: 100 };
    }
}