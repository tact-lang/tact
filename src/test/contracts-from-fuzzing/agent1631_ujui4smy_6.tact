struct NestedOptional {
    maybeInner: Inner?;
}

struct Inner {
    val: Int;
}

contract OptInNest {
    n: NestedOptional;

    init() {
        self.n = NestedOptional{ maybeInner: null };
    }
}