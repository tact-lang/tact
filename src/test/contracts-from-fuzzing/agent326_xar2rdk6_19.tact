contract InitializedOptionals {
    foo: Int? = null;
    bar: Address? = null;
    baz: String? = null;
    flag: Bool? = null;

    init() {
        self.foo = 42;
        self.bar = null;
        self.baz = "hello";
        self.flag = true;
    }

    receive() {
        self.foo = self.foo;
    }
}