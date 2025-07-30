contract BigOptionalDefaults {
    foo: Int? = null;
    bar: Bool? = true;
    num: Int = 17;
    flag: Bool = false;

    init() {
        self.foo = 19;
    }

    receive() {
        let _ = self.foo!! + self.num;
    }
}