contract DefaultOptional {
    foo: Int?;
    bar: Bool = true;

    init() {
        self.foo = null;
    }
}