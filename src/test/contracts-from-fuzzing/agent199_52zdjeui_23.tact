contract OptionalAfterDefault {
    foo: Int = 5;
    bar: Int?;

    init() {
        self.bar = null;
    }
}