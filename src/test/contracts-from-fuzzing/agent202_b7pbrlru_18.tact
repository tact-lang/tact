contract OptIntDefaults {
    foo: Int?;
    bar: Int? = null;
    baz: Int? = 12;

    init() {
        self.foo = 10;
    }

    receive() {
        let _ = self.foo!! + self.baz!!;
    }
}