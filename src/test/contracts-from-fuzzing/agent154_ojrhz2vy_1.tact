struct NestedInner {
    innermost_val: Int;
}

struct NestedOuter {
    nested: NestedInner;
}

contract TestContract {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{ nested: NestedInner{ innermost_val: 42 } };
    }
}