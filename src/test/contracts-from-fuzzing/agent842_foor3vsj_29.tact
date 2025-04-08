contract TrailingSemis {
    foo: Int;
    bar: Bool;
    baz: String;
    qux: Int?;
    qwe: Bool?;
    ert: String?;

    init() {
        self.foo = 1;
        self.bar = true;
        self.baz = "txt";
        self.qux = null;
        self.qwe = false;
        self.ert = null;
    }

    receive() {
        let _=self.foo;
    }
}