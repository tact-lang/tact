contract MultiplePrimitiveFields {
    foo: Int;
    bar: Bool;
    baz: Address;
    str: String;
    init() {
        self.foo = 1;
        self.bar = true;
        self.baz = myAddress();
        self.str = "hello";
    }
}
