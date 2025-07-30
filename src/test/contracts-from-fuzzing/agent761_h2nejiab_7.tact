struct NestedOptionalInner {
    a: Int?;
    b: String?;
}

struct NestedOptionalOuter {
    inner: NestedOptionalInner?;
    c: Bool;
}

contract OptionalDeepNested {
    data: NestedOptionalOuter;

    init() {
        self.data = NestedOptionalOuter{
            inner: NestedOptionalInner{ a: 5, b: null },
            c: true
        };
    }
}
