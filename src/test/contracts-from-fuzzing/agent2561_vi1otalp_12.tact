contract MixedOptionals {
    foo: Int?;
    bar: Bool?;
    baz: String?;
    qux: Address?;
    one: Int;
    two: Bool;
    three: String;
    four: Address;

    init() {
        self.foo = null;
        self.bar = null;
        self.baz = null;
        self.qux = null;
        self.one = 1;
        self.two = true;
        self.three = "abc";
        self.four = myAddress();
    }
}