contract OptionalStructsWithDefaults {
    foo: Int? = null;
    bar: Bool? = null;
    text: String? = null;
    addr: Address? = null;

    init() {
        self.foo = 5;
        self.bar = true;
        self.text = "hello";
        self.addr = myAddress();
    }
}