struct OptionalDefault {
    foo: Int?;
    bar: String?;
}

contract OptDefaults {
    val: OptionalDefault;

    init() {
        self.val = OptionalDefault{
            foo: null,
            bar: null
        };
    }
}