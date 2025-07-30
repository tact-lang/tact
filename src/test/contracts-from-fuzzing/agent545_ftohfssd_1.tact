contract TestContract {
    foo: Int;
    bar: Bool;
    baz: String;

    init() {
        self.foo = 1;
        self.bar = true;
        self.baz = "hello";
    }

    receive() {
        self.foo = self.foo + 1;
    }
}