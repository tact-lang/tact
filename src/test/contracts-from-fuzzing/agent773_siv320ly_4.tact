struct OptionalNested {
    maybeInner: Inner?;
}

struct Inner {
    value: Bool;
}

contract OptionalDeep {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            maybeInner: null,
        };
    }
}