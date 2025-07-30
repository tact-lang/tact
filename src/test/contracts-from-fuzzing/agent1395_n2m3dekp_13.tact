contract InitDefaultsContract {
    foo: Int = 7;
    bar: Bool;

    init() {
        self.bar = true;
        self.foo = 42;
    }
}