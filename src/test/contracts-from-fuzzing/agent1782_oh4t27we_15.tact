contract InlineOptionals {
    foo: Int? = null;
    bar: String? = null;

    init() {
        self.foo = 42;
        self.bar = "yay";
    }
}