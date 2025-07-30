contract ManyPrimitives {
    foo: Int;
    bar: Bool;
    baz: String;
    adr: Address;

    init() {
        self.foo = 123;
        self.bar = true;
        self.baz = "hi";
        self.adr = myAddress();
    }
}