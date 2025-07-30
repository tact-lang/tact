struct NestedInner {
    y: Int;
    optionalBool: Bool?;
}

struct NestedOuter {
    x: Int;
    inner: NestedInner;
}

contract DeepNestedContract {
    complexField: NestedOuter;

    init() {
        self.complexField = NestedOuter{
            x: 1,
            inner: NestedInner{
                y: 2,
                optionalBool: true,
            },
        };
    }
}