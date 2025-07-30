contract OptBeforeNonOpt {
    foo: Int?;
    bar: Int;

    init() {
        self.foo = null;
        self.bar = 42;
    }

    receive() {
        let _=self.foo;
    }
}