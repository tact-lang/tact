contract DefaultedStringOption {
    foo: String?;
    bar: Bool = true;

    init() {
        self.foo = null;
        self.bar = false;
    }
}