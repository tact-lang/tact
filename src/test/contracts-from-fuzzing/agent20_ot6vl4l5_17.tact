contract MismatchTypes {
    foo: Int = 5;
    bar: Bool?;
    baz: String;
    addr: Address;

    init() {
        self.bar = null;
        self.baz = "qwe";
        self.addr = myAddress();
    }
}