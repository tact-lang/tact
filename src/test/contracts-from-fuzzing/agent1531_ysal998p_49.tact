contract NestedPrimitives {
    foo: Int;
    bar: String;
    baz: Bool;
    qux: Address;
    foo2: Int?;
    bar2: String?;
    baz2: Bool?;
    qux2: Address?;

    init() {
        self.foo = 100;
        self.bar = "b";
        self.baz = false;
        self.qux = myAddress();
        self.foo2 = null;
        self.bar2 = null;
        self.baz2 = null;
        self.qux2 = null;
    }
}
