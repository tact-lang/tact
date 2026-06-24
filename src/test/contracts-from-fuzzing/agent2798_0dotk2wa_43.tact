contract OptionalFieldSwap {
    foo: Int?;
    bar: Int?;

    init() {
        self.foo = null;
        self.bar = 10;
        let tmp = self.bar;
        self.bar = self.foo;
        self.foo = tmp;
    }
}