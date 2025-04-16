contract ZeroInitials {
    foo: Int;
    bar: Bool;
    baz: String;

    init() {
        self.foo = 0;
        self.bar = false;
        self.baz = "";
    }
}