contract TestContract {
    foo: Bool? = true;
    bar: Bool? = null;

    init() {
        self.foo = false;
        self.bar = true;
    }
}