struct NestedOptionalInner {
    x: Int;
}

struct NestedOptionalOuter {
    inner: NestedOptionalInner?;
}

contract OptionalOfStruct {
    outerField: NestedOptionalOuter;
    init() {
        self.outerField = NestedOptionalOuter{ inner: null };
    }
}