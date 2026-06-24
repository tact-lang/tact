contract TestContract {
    foo: Int = 1;
    bar: Bool;
    baz: Int?;

    init() {
        self.bar = true;
        self.baz = null;
    }
}