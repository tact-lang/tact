struct NestedOptional {
    maybeInner: Inner?;
}

struct Inner {
    deepInner: Deep?;
}

struct Deep {
    value: Int;
}

contract NestedOptionalsContract {
    s: NestedOptional;

    init() {
        self.s = NestedOptional{maybeInner: null};
    }
}