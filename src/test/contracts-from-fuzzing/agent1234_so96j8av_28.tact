struct Inner {
    foo: Int = 99;
    bar: Bool? = false;
}

contract OptionalWithDefaults {
    data: Inner?;

    init() {
        self.data = null;
    }
}