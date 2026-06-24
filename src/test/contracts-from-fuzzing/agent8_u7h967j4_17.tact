contract DefaultOptional {
    foo: Int? = null;
    bar: Bool? = false;

    init() {
        self.foo = null;
        self.bar = true;
    }
}