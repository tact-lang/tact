struct NestedInner {
    deepField: Int?;
}

struct NestedOuter {
    nested: NestedInner;
    another: Bool;
}

contract DeepNestedOptionalTest {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            nested: NestedInner{ deepField: null },
            another: true
        };
    }
}