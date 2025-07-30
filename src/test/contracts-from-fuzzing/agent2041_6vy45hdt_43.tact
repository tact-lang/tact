contract AllOptionals {
    foo: Int? = null;
    bar: Bool? = null;
    str: String? = null;
    s2: String? = null;
    init() {
        self.foo = null;
        self.bar = null;
        self.str = null;
        self.s2 = null;
    }
}