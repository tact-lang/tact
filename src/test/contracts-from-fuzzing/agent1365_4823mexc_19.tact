struct OptionalBool {
    a: Bool?;
    b: Bool?;
}

contract OptBoolNested {
    inner: OptionalBool?;

    init() {
        self.inner = OptionalBool{
            a: null,
            b: true,
        };
    }
}