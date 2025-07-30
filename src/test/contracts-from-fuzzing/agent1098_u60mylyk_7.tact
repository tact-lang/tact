struct InnerMost {
    value: Int;
}

struct Middle {
    inner: InnerMost?;
    label: String;
}

struct OuterLayer {
    middle: Middle?;
    status: Bool;
}

contract OptionalDeepNested {
    field: OuterLayer;

    init() {
        self.field = OuterLayer{
            middle: null,
            status: true
        };
    }
}
