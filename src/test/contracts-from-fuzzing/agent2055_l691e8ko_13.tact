struct SChild {
    val: Int;
}

struct SParent {
    child1: SChild;
    child2: SChild;
}

contract OptionalNestedStructField {
    s: SParent?;

    init() {
        self.s = SParent {
            child1: SChild{val:1},
            child2: SChild{val:2}
        };
    }
}
