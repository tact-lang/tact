contract OnlyInit {
    foo: Int;
    bar: Bool;
    baz: String;
    adr: Address;

    init() {
        self.foo = 5;
        self.bar = true;
        self.baz = "init";
        self.adr = myAddress();
    }

    receive() {}
}