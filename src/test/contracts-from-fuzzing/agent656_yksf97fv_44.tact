contract InitAndFields {
    foo: Int = 1;
    bar: Bool;
    note: String?;

    init() {
        self.bar = false;
        self.note = "ok";
        self.foo = 42;
    }
}
