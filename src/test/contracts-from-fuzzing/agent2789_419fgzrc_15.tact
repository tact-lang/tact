contract DefaultOptionalVariants {
    foo: Int? = null;
    bar: Bool = true;

    init() {
        self.foo = null;
        self.bar = false;
    }
}
