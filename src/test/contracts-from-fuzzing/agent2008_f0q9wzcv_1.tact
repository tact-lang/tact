struct NullableInner {
    x: Int;
    y: Bool;
}

struct Container {
    optInner: NullableInner?;
    value: Int;
}

contract OptionalNestedStruct {
    data: Container;

    init() {
        self.data = Container{
            optInner: null,
            value: 55
        };
    }
}
