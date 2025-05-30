contract VariousDefaults {
    foo: Int = 4;
    bar: Bool;
    baz: String = "abc";
    opt: Int?;

    init() {
        self.bar = true;
        self.opt = null;
    }
}