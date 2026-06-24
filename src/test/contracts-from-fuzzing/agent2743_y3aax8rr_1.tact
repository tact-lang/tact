struct NestedInner {
    innerField: Int;
}

struct NestedOuter {
    nested: NestedInner;
    optField: Int?;
}

contract NestedTest {
    nestedOuter: NestedOuter;

    init() {
        self.nestedOuter = NestedOuter{
            nested: NestedInner{ innerField: 1 },
            optField: null,
        };
    }
}