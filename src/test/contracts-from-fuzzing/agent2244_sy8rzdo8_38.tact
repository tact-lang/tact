contract DefaultsInits {
    foo: Int = 5;
    bar: String = "abc";
    baz: Bool = true;

    init() {
        self.foo = 42;
        self.bar = "def";
        self.baz = false;
    }
}