struct OptNest {
    foo: Int?;
    bar: Bool?;
}

contract OptionalNestedStructField {
    s: OptNest?;

    init() {
        self.s = null;
    }
}