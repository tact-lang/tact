struct OuterShadow {
    shared: Int?;
    inner: InnerShadow;
}

struct InnerShadow {
    shared: Int?;
    value: Bool;
}

contract ShadowOptional {
    nested: OuterShadow;

    init() {
        self.nested = OuterShadow{
            shared: null,
            inner: InnerShadow{
                shared: 123,
                value: true
            }
        };
    }
}
