struct NestedMultiDefault {
    inner: InnerDefault;
}

struct InnerDefault {
    x: Int = 5;
    y: Bool = false;
}

contract NestedDefault {
    stuff: NestedMultiDefault = NestedMultiDefault{
        inner: InnerDefault{
            x: 7,
            y: true
        }
    };
}