contract OnlyOptional {
    foo: Int?;
    bar: Bool?;

    init() {
        self.foo = null;
        self.bar = null;
    }

    receive() {
        let _=self.foo;
    }
}