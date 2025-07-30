struct OptionalDefaults {
    x: Int?;
    y: Int?;
}

contract OptionalStructDefaults {
    foo: OptionalDefaults;
    init() {
        self.foo = OptionalDefaults{
            x: null,
            y: null
        };
    }
}