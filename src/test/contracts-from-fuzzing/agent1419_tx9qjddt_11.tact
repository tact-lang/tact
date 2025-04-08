contract OnlyRequiredInit {
    foo: Int;
    bar: String = "def";
    baz: Bool;

    init() {
        self.foo = 1;
        self.baz = false;
    }
}