contract MultiplePrimitiveFields {
    foo: Int;
    bar: Bool;
    addr: Address;
    text: String;

    init() {
        self.foo = 7;
        self.bar = true;
        self.addr = myAddress();
        self.text = "ok";
    }
}