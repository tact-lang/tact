contract TestContract {
    foo: Int = 7;
    bar: Bool?;
    baz: Int? = null;

    init() {
        self.bar = true;
        self.baz = 5;
    }
}