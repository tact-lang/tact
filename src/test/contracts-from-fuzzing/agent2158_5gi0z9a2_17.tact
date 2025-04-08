contract InitDefaultValues {
    foo: Int = 10;
    bar: Bool = true;
    baz: String = "hello";

    init() {
        self.foo = 5;
        self.bar = false;
        self.baz = "bye";
    }
}