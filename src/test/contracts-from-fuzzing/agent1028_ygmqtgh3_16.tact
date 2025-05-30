struct Inner {
    foo: Int = 7;
    bar: Bool?;
}

contract OptionalOfDefaults {
    data: Inner?;

    init() {
        self.data = null;
    }
}